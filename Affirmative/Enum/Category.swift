// Created by Vlad Lysenka 01.08.2024 

import SwiftUI

enum Category: String, CaseIterable, Codable {
    case love       = "heart.fill"
    case friendship = "figure.2"
    
    var id: Self { self }
    
    var title: LocalizedStringKey {
        switch self {
        case .love      : "Love"
        case .friendship: "Friendship"
        }
    }
    
    var color: Color {
        switch self {
        case .love      : .red
        case .friendship: .brown
        }
    }
}






