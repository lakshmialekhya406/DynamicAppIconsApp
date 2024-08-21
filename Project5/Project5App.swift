//
//  Project5App.swift
//  Project5
//
//  Created by Batchu Lakshmi Alekhya on 12/08/24.
//

import SwiftUI

@main
struct Project5App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ModificationsVC()
        }
    }
}
