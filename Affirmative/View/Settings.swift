// Created by Vlad Lysenka 01.08.2024

import SwiftUI

struct Settings: View {
    @AppStorage("onboarding_category") private var category: Category = .love
    @AppStorage("onboarding_background") private var background: Background = .blue
    @AppStorage("onboarding_gender") private var gender: Gender = .male
    var body: some View {
        NavigationStack {
            List {
                Picker("Category", selection: $category) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Text(category.title)
                    }
                }
                .pickerStyle(.navigationLink)
                
                Picker("Background color", selection: $background) {
                    ForEach(Background.allCases, id: \.self) { background in
                        Text(background.title)
                    }
                }
                .pickerStyle(.navigationLink)
                
                Picker("Gender", selection: $gender) {
                    ForEach(Gender.allCases, id: \.self) { gender in
                        Text(gender.title)
                    }
                }
                .pickerStyle(.navigationLink)
                
                Text("Language selection")
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        openSettings()
                    }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func openSettings() {
        if let appSettings = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(appSettings)
        }
    }
}

#Preview {
    Settings()
}
