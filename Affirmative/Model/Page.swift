// Created by Vlad Lysenka 01.08.2024 

import SwiftUI

struct Page {
    var title: LocalizedStringKey
    var subtitle: LocalizedStringKey
    var configure: Configure
    
    enum Configure {
        case category, background, gender
    }
    
    static let samples: [Page] = [
        Page(title: "Select a category", subtitle: "The category will help you choose affirmations that best suit your goals and interests.", configure: .category),
        Page(title: "Select a background", subtitle: "It is better to choose a background colour that creates a pleasant and inspiring mood for you.", configure: .background),
        Page(title: "Choose a gender", subtitle: "Gender will help to make affirmations more personalised.", configure: .gender)
    ]
}
