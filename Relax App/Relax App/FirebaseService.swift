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
            guard let data = snapshot.documents.first?.data(), let name = data["name"] as? String, let date = (data["date"] as? Timestamp)?.dateValue()  else { return nil }
            
            if let imageURL = data["image"] as? String {
                let storage = Storage.storage()
                
            }
            if let imagesURL = data["images"] as? [String] {
                let storage = Storage.storage()
                
            }
            return User(name: name, email: email, birthdayDate: date)
        }
        catch {
            return nil
        }
        
    }
    
    func register(email: String, password: String, name: String, date: Date) async -> User? {
        do {
            let user = try await Auth.auth().createUser(withEmail: email, password: password)
            let result: Bool = await withCheckedContinuation { resume in
                let database = Firestore.firestore()
                database.collection("users").addDocument(data: ["user" : user.user.uid, "date": date, "name": name]) { error in
                    resume.resume(returning: error == nil)
                }
            }
            if !result {
                return nil
            }
            return User(name: name, email: email, birthdayDate: date)
            
        }
        catch {
            return nil
        }
    }
    
    func update(image: UIImage, uid: String) async {
        //image.jpegData(compressionQuality: 0.8)
    }
    
    func loadImage(image: UIImage, uid: String) async {
        
    }
    
    func deleteImage(name: String, uid: String) async {
        
    }
    
}
