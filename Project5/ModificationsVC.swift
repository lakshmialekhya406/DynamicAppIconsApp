//
//  ModificationsVC.swift
//  Project5
//
//  Created by Batchu Lakshmi Alekhya on 12/08/24.
//

import SwiftUI

struct ModificationsVC: View {
    @StateObject var qaManager = QuickActionsManager.instance
    var listOfModifications: [Modification] = [.appIcon, .customizations]
    @State private var navigateToContentView: Bool = false // State variable to control navigation
    @State private var isDarkMode: Bool = UserDefaults.standard.bool(forKey: "isDarkMode")
    @State private var navigateToThemeView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Modifications of App")
                    .bold()
                    .font(.title)
                List(listOfModifications, id: \.self) { modification in
                    switch modification {
                    case .appIcon:
                        NavigationLink(destination: ContentView(isDarkMode: $isDarkMode)) {
                            Text("\(modification.title)")
                        }
                        .listRowBackground(Color(uiColor: UIColor(named: "PrimaryBackgroud")!.withAlphaComponent(0.3))) // Cell background color
                        
                    case .customizations:
                        NavigationLink(destination:ThemePreferenceView(isDarkMode: $isDarkMode)) {
                            Text("\(modification.title)")
                        }
                        .listRowBackground(Color(uiColor: UIColor(named: "PrimaryBackgroud")!.withAlphaComponent(0.3))) // Cell background color
                        
                    }
                }
                .padding()
                .listStyle(PlainListStyle()) // Use a plain list style to remove the default background
                .background(Color.clear)
                .navigationTitle("")
                
                NavigationLink(destination: ContentView(isDarkMode: $isDarkMode), isActive: $navigateToContentView) {
                    EmptyView()
                }
                NavigationLink(destination: ThemePreferenceView(isDarkMode: $isDarkMode), isActive: $navigateToThemeView) {
                    EmptyView()
                }
            }
            .onChange(of: qaManager.quickAction) { _, _ in
                handleQAData()
            }
            .onChange(of: isDarkMode) { newValue in
                UserDefaults.standard.set(newValue, forKey: "isDarkMode")
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .background(Color(uiColor: UIColor(named: "PrimaryBackgroud")!))
            
        }
    }
    
    private func handleQAData() {
        if qaManager.quickAction == .icon {
            navigateToContentView = true
            qaManager.quickAction = nil
        } else if qaManager.quickAction == .theme {
            navigateToThemeView = true
            qaManager.quickAction = nil
        }
    }
}

#Preview {
    ModificationsVC()
}

enum Modification {
    case appIcon
    case customizations
    
    var title: String {
        switch self {
        case .appIcon:
            return "App Icon"
        case .customizations:
            return "Theme"
        }
    }
}
