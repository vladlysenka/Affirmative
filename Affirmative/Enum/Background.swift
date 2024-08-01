// Created by Vlad Lysenka 01.08.2024 

import SwiftUI

enum Background: String, CaseIterable {
    case blue
    case red
    
    var id: Self { self }

    var title: LocalizedStringKey {
        switch self {
        case .blue: "Blue"
        case .red : "Red"
        }
    }
    
    var color: Color {
        switch self {
        case .blue: .blue
        case .red : .red
        }
    }
}
