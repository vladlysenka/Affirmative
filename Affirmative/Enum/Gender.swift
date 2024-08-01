// Created by Vlad Lysenka 01.08.2024 

import SwiftUI

enum Gender: String, CaseIterable, Codable {
    case male   = "m.square"
    case female = "f.square"
    
    var id: Self { self }
    
    var title: LocalizedStringKey {
        switch self {
        case .male  : "Male"
        case .female: "Female"
        }
    }
}
