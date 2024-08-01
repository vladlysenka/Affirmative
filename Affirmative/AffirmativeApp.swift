// Created by Vlad Lysenka 01.08.2024 

import SwiftUI

@main
struct AffirmativeApp: App {
    var body: some Scene {
        WindowGroup {
            Affirmations()
                .modelContainer(for: Affirmation.self)
        }
    }
}
