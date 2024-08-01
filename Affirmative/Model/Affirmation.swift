// Created by Vlad Lysenka 01.08.2024

import SwiftUI
import SwiftData

@Model class Affirmation {
    var text: String = ""
    var category: Category = Category.love
    var gender: Gender = Gender.male
    var favorite: Bool = false
    
    init(text: String, favorite: Bool = false, category: Category, gender: Gender) {
        self.text = text
        self.favorite = favorite
        self.category = category
        self.gender = gender
    }
    
    static var samples: [Affirmation] = [
        /// Love
        Affirmation(text: "I am worthy of love and deserve to receive love in abundance", category: .love, gender: .male),
        Affirmation(text: "My heart is open to giving and receiving love", category: .love, gender: .male),
        Affirmation(text: "I am surrounded by love every day and in every way", category: .love, gender: .male),
        Affirmation(text: "I attract love and loving relationships into my life", category: .love, gender: .male),
        Affirmation(text: "Love flows to me and through me effortlessly", category: .love, gender: .male),
        Affirmation(text: "I radiate love and others reflect love back to me", category: .love, gender: .male),
        Affirmation(text: "My relationships are filled with love, happiness, and respect", category: .love, gender: .male),
        Affirmation(text: "I am grateful for the love that surrounds me", category: .love, gender: .male),
        Affirmation(text: "Love comes to me easily and effortlessly", category: .love, gender: .male),
        Affirmation(text: "I am a magnet for loving and fulfilling relationships", category: .love, gender: .male),
        /// Friendship
        Affirmation(text: "I am surrounded by supportive and loving friends", category: .friendship, gender: .male),
        Affirmation(text: "I attract positive and loyal friendships into my life", category: .friendship, gender: .male),
        Affirmation(text: "My friends and I share mutual respect and trust", category: .friendship, gender: .male),
        Affirmation(text: "I am a kind and caring friend, and I receive the same in return", category: .friendship, gender: .male),
        Affirmation(text: "My friendships are filled with joy, laughter, and understanding", category: .friendship, gender: .male),
        Affirmation(text: "I am grateful for the amazing friends in my life", category: .friendship, gender: .male),
        Affirmation(text: "I nurture and cherish my friendships", category: .friendship, gender: .male),
        Affirmation(text: "I attract friends who support and uplift me", category: .friendship, gender: .male),
        Affirmation(text: "My friends and I grow together in friendship and harmony", category: .friendship, gender: .male),
        Affirmation(text: "I am a magnet for genuine and lasting friendships", category: .friendship, gender: .male)
    ]
}
