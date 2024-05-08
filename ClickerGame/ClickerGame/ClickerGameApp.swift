//
//  ClickerGameApp.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 24/12/2023.
//

import SwiftUI
import SwiftData


@main
struct ClickerGameApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .modelContainer(for: User.self)
    }
}
