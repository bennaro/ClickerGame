//
//  Settings.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 24/12/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var showAlert = false
    
    func resetGame() {
        UserDefaults.standard.set(0.0, forKey: "count")
        UserDefaults.standard.set(1.0, forKey: "clickIncrement")
        UserDefaults.standard.set(0.0, forKey: "autoClickRate")
        UserDefaults.standard.set(1.0, forKey: "autoClickerInterval")
        UserDefaults.standard.set(10.0, forKey: "clickIncrementCost")
        UserDefaults.standard.set(100.0, forKey: "autoClickRateCost")
        UserDefaults.standard.set(1000.0, forKey: "autoClickerIntervalCost")
        UserDefaults.standard.set("Cookie:600", forKey: UserDefaultsCookie.selectedCookieImage)
        UserDefaults.standard.set("Original Background:600", forKey: UserDefaultsBackground.selectedBackground)
        UserDefaults.standard.set("HelveticaNeue", forKey: UserDefaultsFont.selectedFont)
        // Add other keys as needed
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section (header: Text("Profile")){
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Label("Profile", systemImage: "person.circle")
                    }
                }
                
                Section(header: Text("Dark mode")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.circle")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.accentColor))
                }
                
                Section (header: Text("Style")){
                    NavigationLink {
                        ChangeCookies()
                    } label: {
                        Label("Change Cookies", systemImage: "plus.circle")
                    }
                    NavigationLink {
                        ChangeBackground()
                    } label: {
                        Label("Change Background", systemImage: "photo.circle")
                    }
                    NavigationLink {
                        ChangeFont()
                    } label: {
                        Label("Change Font", systemImage: "17.circle")
                    }
                    
                }
                
                Button("Reset Game") {
                    showAlert = true
                }
                .tint(.red)
                
            }
            .navigationTitle("Settings")
            .alert(isPresented: $showAlert, content: {
                Alert(
                    title: Text("Reset Game"),
                    message: Text("Are you sure you want to reset the game?"),
                    primaryButton: .default(Text("Yes")) {
                        resetGame()
                    },
                    secondaryButton: .cancel()
                )
            })
        }
    }
}

#Preview {
    SettingsView()
}
