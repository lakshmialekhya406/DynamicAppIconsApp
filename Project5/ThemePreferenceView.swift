//
//  ThemePreferenceView.swift
//  Project5
//
//  Created by Batchu Lakshmi Alekhya on 20/08/24.
//

import SwiftUI

struct ThemePreferenceView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        VStack {
            Toggle("Enable Dark Mode", isOn: $isDarkMode)
                .padding()
            Spacer()
        }
        .background(Color(uiColor: UIColor(named: "PrimaryBackgroud")!))
    }
}

//#Preview {
//    ThemePreferenceView()
//}
