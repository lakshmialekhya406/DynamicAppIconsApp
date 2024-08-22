//
//  ContentView.swift
//  Project5
//
//  Created by Batchu Lakshmi Alekhya on 12/08/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var isDarkMode: Bool
    let images:[String] = ["AppIcon", "AppIcon_1", "AppIcon_2", "AppIcon_3"]
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor(named: "PrimaryBackgroud")!) // Background color for the entire view
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Change your app icon")
                HStack(spacing: 10){
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: UIImage(named: image)!)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .onTapGesture {
                                changeAppIcon(to: image == "AppIcon" ? nil : image)
                            }
                            .border(.black, width: 1)
                    }
                }
            }
            .padding()
            .background(.blue.opacity(0.5))
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    private func changeAppIcon(to iconName: String?) {
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if let error = error {
                print("Error setting alternate icon \(error.localizedDescription)")
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
