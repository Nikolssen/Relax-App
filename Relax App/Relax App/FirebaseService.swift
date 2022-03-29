//
//  FirebaseService.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/25/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import UIKit


final class FirebaseService {
    
    func signIn(email: String, password: String) async -> User?  {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            let uid = result.user.uid
            let database = Firestore.firestore()
            let snapshot = try await database.collection("users").whereField("user", isEqualTo: uid).getDocuments()
            guard let document = snapshot.documents.first else { return nil }
            let data = document.data()
            guard let name = data["name"] as? String, let date = (data["date"] as? Timestamp)?.dateValue()  else { return nil }
            
            let weight: Float? = data["weight"] as? Float
            let height: Float? = data["height"] as? Float
            
            let storage = Storage.storage()
            let avatar: UIImage? = await withCheckedContinuation { resume in
                storage.reference().child(uid).child("avatar.jpeg").getData(maxSize: 1024*1024*6) { data, _ in
                        if let data = data, let image = UIImage(data: data) {
                            resume.resume(returning: image)
                        }
                    else {
                        resume.resume(returning: nil)
                    }
                    }
            }

            let emotions: [(Date, Emotion)]? = try? await database.collection("emotions").whereField("user", isEqualTo: uid).getDocuments().documents.compactMap { document -> (Date, Emotion)? in
                let data = document.data()
                guard let date = (data["date"] as? Timestamp)?.dateValue(),
                let emotionString = data["emotion"] as? String, let emotion = Emotion.value(from: emotionString) else { return nil }
                return (date, emotion)
            }
            
            let userImages: [(Date, String)] = (try? await database.collection("images").whereField("user", isEqualTo: uid).getDocuments().documents.compactMap { document -> (Date, String)? in
                let data = document.data()
                guard let reference = data["link"] as? String,
                      let date = (data["date"] as? Timestamp)?.dateValue() else { return nil }
                return (date, reference)
            }) ?? []
            var images: [(UIImage, Date, String)] = []
            for value in userImages {
                
                let image: UIImage? = await withCheckedContinuation { resume in
                    storage.reference(withPath: value.1).getData(maxSize: 1024*1024*6) { data, _ in
                            if let data = data, let image = UIImage(data: data) {
                                resume.resume(returning: image)
                            }
                        else {
                            resume.resume(returning: nil)
                        }
                            
                        }
                }
                if let image = image {
                    images.append((image, value.0, value.1))
                }
            }
            return User(name: name, email: email, birthdayDate: date, weight: weight, height: height, image: avatar, images: images, emotions: emotions ?? [], document: document.reference.path, uid: uid)
        }
        catch {
            return nil
        }
        
    }
    
    func register(email: String, password: String, name: String, date: Date) async -> User? {
        do {
            let user = try await Auth.auth().createUser(withEmail: email, password: password)
            
                let database = Firestore.firestore()
                let reference = database.collection("users").addDocument(data: ["user" : user.user.uid, "date": date, "name": name])
            
            return User(name: name, email: email, birthdayDate: date, weight: nil, height: nil, image: nil, images: [], emotions: [], document: reference.path, uid: user.user.uid)
            
        }
        catch {
            return nil
        }
    }
    
    func update(image: UIImage, user: User) async {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        let reference = Storage.storage().reference().child(user.uid).child("avatar.jpeg")
        reference.putData(data).resume()
        user.image = image
        
    }
    
    func load(image: UIImage, date: Date, user: User) async {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        let reference = Storage.storage().reference().child(user.uid).child(String(date.timeIntervalSince1970).replacingOccurrences(of: ".", with: "_") + ".jpeg")
        reference.putData(data).resume()
        let database = Firestore.firestore()
        database.collection("images").addDocument(data: ["user": user.uid, "date": date, "link": reference.fullPath])
        user.images.append((image, date, reference.fullPath))
    }
    
    func delete(name: String, reference: String, user: User) async {
        let storage = Storage.storage()
        try? await storage.reference(forURL: reference).delete()
        let database = Firestore.firestore()
        let snapshot = try? await database.collection("images").whereField("uid", isEqualTo: user.uid).whereField("link", isEqualTo: reference).getDocuments()
        try? await snapshot?.documents.first?.reference.delete()
    }
    
    func upload(emotion: Emotion, for date: Date, for user: User) {
        let database = Firestore.firestore()
        database.collection("emotions").addDocument(data: ["user": user.uid, "emotion": emotion.description, "date": date])
    }
      
    func change(weight: Float, for user: User) async {
        let database = Firestore.firestore()
        try? await database.document(user.document).updateData(["weight": weight])
    }
    
    func change(height: Float, for user: User) async {
        let database = Firestore.firestore()
        try? await database.document(user.document).updateData(["height": height])
    }
}
