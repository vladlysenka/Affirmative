// Created by Vlad Lysenka 01.08.2024

import SwiftUI


struct Onboarding: View {
    @AppStorage("onboarding_show") private var onboarding: Bool = true
    @AppStorage("onboarding_category") private var category: Category = .love
    @AppStorage("onboarding_background") private var background: Background = .blue
    @AppStorage("onboarding_gender") private var gender: Gender = .male
    
    @State private var pages: [Page] = Page.samples
    @State private var activePage: Int = 0
    
    var body: some View {
        let currentPage = pages[activePage]
        
        VStack(spacing: 20) {
            Spacer()
            
            // Title
            Text(currentPage.title)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .lineLimit(1)
                .kerning(1.2)
            
            // Content
            switch currentPage.configure {
            case .category:
                Categories()
            case .background:
                Backgrounds()
            case .gender:
                Genders()
            }
            
            // Subtitle
            Text(currentPage.subtitle)
                .font(.system(size: 13, weight: .regular, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .padding(.horizontal, 10)
        }
        .safeAreaPadding(.bottom, 120)
        .overlay(alignment: .bottomLeading) {
            if activePage > 0 {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .frame(width: 50, height: 50)
                    .background(.ultraThinMaterial, in: .circle)
                    .onTapGesture {
                        activePage -= 1
                    }
                    .padding()
                    .padding(.bottom)
            }
        }
        .overlay(alignment: .bottom) {
            Button {
                if activePage == pages.count - 1 {
                    onboarding = false
                } else {
                    activePage += 1
                }
            } label: {
                Text(activePage == pages.count - 1 ? "Start" : "Further")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .frame(height: 50)
                    .frame(maxWidth: 180)
                    .background(.purple, in: .capsule)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom)
            }
        }
        .overlay(alignment: .bottom) {
            Indicator()
        }
    }
    
    @ViewBuilder func Categories() -> some View {
        let columns: [GridItem] = Array(repeating: GridItem(spacing: 10), count: 2)
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(Category.allCases, id: \.self) { category in
                HStack {
                    Image(systemName: category.rawValue)
                        .foregroundStyle(category.color.gradient)
                    
                    Text(category.title)
                    
                    Spacer()
                }
                .padding(15)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
                .background(self.category == category ? .blue : .clear, in: .rect(cornerRadius: 20).stroke(lineWidth: 2.5))
                .contentShape(.rect)
                .onTapGesture {
                    self.category = category
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder func Backgrounds() -> some View {
        let columns: [GridItem] = Array(repeating: GridItem(spacing: 10), count: 2)
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(Background.allCases, id: \.self) { background in
                HStack {
                    Image(systemName:"circle.fill")
                        .foregroundStyle(background.color)
                    
                    Text(background.title)
                    
                    Spacer()
                }
                .padding(15)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
                .background(self.background == background ? .blue : .clear, in: .rect(cornerRadius: 20).stroke(lineWidth: 3))
                .contentShape(.rect)
                .onTapGesture {
                    self.background = background
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder func Genders() -> some View {
        let columns: [GridItem] = Array(repeating: GridItem(spacing: 10), count: 1)
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(Gender.allCases, id: \.self) { gender in
                HStack {
                    Image(systemName: gender.rawValue)
                    
                    Text(gender.title)
                    
                    Spacer()
                }
                .padding(15)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
                .background(self.gender == gender ? .blue : .clear, in: .rect(cornerRadius: 20).stroke(lineWidth: 3))
                .contentShape(.rect)
                .onTapGesture {
                    self.gender = gender
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder func Indicator() -> some View {
        HStack(spacing: 6) {
            ForEach(pages.indices, id: \.self) { index in
                Capsule()
                    .fill(.primary.opacity(activePage == index ? 1 : 0.4))
                    .frame(width: activePage == index ? 25 : 8, height: 8)
            }
        }
        .animation(.default, value: activePage)
    }
}


#Preview {
    Onboarding()
}


