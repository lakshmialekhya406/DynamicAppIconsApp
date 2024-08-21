//
//  ContentView.swift
//  Project5
//
//  Created by Batchu Lakshmi Alekhya on 12/08/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor(named: "PrimaryBackgroud")!) // Background color for the entire view
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Change your app icon")
                HStack(spacing: 10){
                    Image(uiImage: UIImage(named: "AppIcon")!)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .onTapGesture {
                            changeAppIcon(to: nil) // To revert to the default icon
                        }
                        .border(.black, width: 1)
                    Image(uiImage: UIImage(named: "AppIcon_1")!)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .onTapGesture {
                            changeAppIcon(to: "AppIcon_1") // this is the same value of the image asset catalog
                        }
                        .border(.black, width: 1)
                    Image(uiImage: UIImage(named: "AppIcon_2")!)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .onTapGesture {
                            changeAppIcon(to: "AppIcon_2") // this is the same value of the image asset catalog
                        }
                        .border(.black, width: 1)
                    Image(uiImage: UIImage(named: "AppIcon_3")!)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .onTapGesture {
                            changeAppIcon(to: "AppIcon_3") // this is the same value of the image asset catalog
                        }
                        .border(.black, width: 1)
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
