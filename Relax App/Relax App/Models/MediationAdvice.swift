//
//  MediationAdvice.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/17/22.
//

import Foundation
import SwiftUI

struct MeditationAdvice {
    let image: Image
    let title: String
    let description: String
    let shortDescription: String
    let emotion: Emotion
    
    static let advices: [MeditationAdvice] = [
        
        .init(image: Image("Meditation-Calm"), title:  "Meditation Advice", description: "Practice mindful meditation. The goal of mindful meditation is to focus your attention on things that are happening right now in the present moment. For example, listen to your body. Is your breathing fast, slow, deep, or shallow? Do you hear noises, such as traffic, or do you hear only silence? The idea is just to note what is happening without trying to change it.", shortDescription: "Practice mindful meditation. The goal of...", emotion: .calm),
        
        .init(image: Image("Meditation-Depression"), title: "Sleep hygiene", description: "Sleep and mood are intimately related. A 2014 study found that 80% of people with major depressive disorder experience sleep disturbances. But, you might feel like you just can't fall asleep. Or perhaps you struggle to get out of bed because you feel exhausted all the time.",  shortDescription: "Sleep and mood are intimately related.", emotion: .depressed),
              
        .init(image: Image("Meditation-Rage"), title: "Cognitive restructing", description: "Simply put, this means changing the way you think. Angry people tend to curse, swear, or speak in highly colorful terms that reflect their inner thoughts. When you're angry, your thinking can get very exaggerated and overly dramatic. Try replacing these thoughts with more rational ones. For instance, instead of telling yourself that it's awful, it's terrible, everything's ruined. Tell yourself, it's frustrating, and it's understandable that I'm upset about it, but it's not the end of the world and getting angry is not going to fix it anyhow.", shortDescription: "Simply put, this means changing the way you think...", emotion: .enraged),
        
        .init(image: Image("Meditation-Focus"), title: "Dealing Distractions", description: "While it may sound obvious, people often underestimate just how many distractions prevent them from concentrating on the task at hand. Such intrusions might come in the form of a radio blaring in the background or perhaps an obnoxious co-worker who constantly drops by your cubicle to chat.              Minimizing these sources of distraction isn't always as easy as it sounds. While it might be as simple as turning off the television or radio, you might find it much more challenging to deal with an interrupting co-worker, spouse, child, or roommate.", shortDescription: "While it may sound obvious, people often...", emotion: .focused),
        
        .init(image: Image("Meditation-Relax"), title: "Muscle Relaxation", description: "Try progressive muscle relaxation. This process involves tensing and relaxing each muscle group. Progressive muscle relaxation can reduce anxiety and muscle tension. If you have trouble falling asleep, this method may also help with your sleep problems. When you relax your muscles, your body gets the signal that it is okay to fall asleep.", shortDescription: "Try progressive muscle relaxation...", emotion: .relaxed),
        
        .init(image: Image("Meditation-Worry"), title: "Worry periods", description: "Choose a set time and place for worrying. It should be the same every day (e.g. in the living room from 5:00 to 5:20 p.m.) and early enough that it won’t make you anxious right before bedtime. During your worry period, you’re allowed to worry about whatever’s on your mind. The rest of the day, however, is a worry-free zone.", shortDescription: "Choose a set time and...", emotion: .worried),
        
        .init(image: Image("Meditation-Focus-2"), title: "Mental focus", description: "Building your mental focus is not something that will happen overnight. Even professional athletes require plenty of time and practice in order to strengthen their concentration skills. One of the first steps is to recognize the impact that being distracted is having on your life. If you are struggling to accomplish your goals and find yourself getting sidetracked by unimportant details, it is time to start placing a higher value on your time.", shortDescription: "Building your mental focus is not something...", emotion: .focused)
    ]
}
