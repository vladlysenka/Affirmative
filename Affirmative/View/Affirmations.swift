// Created by Vlad Lysenka 01.08.2024

import SwiftUI
import SwiftData

struct Affirmations: View {
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) private var scheme
    
    @AppStorage("onboarding_show") private var onboarding: Bool = true
    @AppStorage("onboarding_category") private var category: Category = .love
    @AppStorage("onboarding_background") private var background: Background = .blue
    @AppStorage("onboarding_gender") private var gender: Gender = .male
    
    @Query(sort: \Affirmation.text, animation: .default) private var affirmations: [Affirmation]
    
    @State private var isSettings: Bool = false
    @State private var isCreate: Bool = false
    @State private var text: String = ""
    
    private var filterAffirmations: [Affirmation] {
        affirmations.filter{ $0.category == self.category }
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(filterAffirmations) { affirmation in
                    VStack {
                        Text(LocalizedStringKey(affirmation.text))
                            .font(.system(size: 22, weight: .semibold, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        
                        Button {
                            affirmation.favorite.toggle()
                        } label: {
                            Image(systemName: affirmation.favorite ? "star.fill" : "star")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.yellow)
                                .padding(8)
                                .background(.regularMaterial, in: .circle)
                                .environment(\.colorScheme, .dark)
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.ultraThinMaterial)
                            .shadow(radius: 10)
                    }
                    .padding()
                    .containerRelativeFrame(.vertical, alignment: .center)
                }
                
                Text("Add an affirmation")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(scheme == .light ? .black : .white)
                    .padding()
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
                    .onTapGesture {
                        isCreate.toggle()
                    }
                    .containerRelativeFrame(.vertical, alignment: .center)
            }
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
        .safeAreaPadding(.vertical)
        .background(background.color.gradient)
        .overlay(alignment: .topTrailing) {
            Image(systemName: "gearshape.fill")
                .padding(10)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
                .padding()
                .onTapGesture {
                    isSettings.toggle()
                }
        }
        .fullScreenCover(isPresented: $onboarding) {
            Onboarding()
        }
        .sheet(isPresented: $isSettings) {
            Settings()
        }
        .sheet(isPresented: $isCreate) {
            NavigationStack {
                List {
                    TextField("Text", text: $text)
                }
                .navigationTitle("Add an affirmation")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "checkmark.circle") {
                            let affirmation = Affirmation(text: text, category: category, gender: gender)
                            context.insert(affirmation)
                            text = ""
                            isCreate.toggle()
                        }
                        .disabled(text.isEmpty)
                    }
                }
            }
        }
        .onAppear {
            if affirmations.isEmpty {
                for affirmation in Affirmation.samples {
                    context.insert(affirmation)
                }
            }
        }
    }
}

#Preview {
    Affirmations()
        .modelContainer(for: Affirmation.self, inMemory: true)
}
