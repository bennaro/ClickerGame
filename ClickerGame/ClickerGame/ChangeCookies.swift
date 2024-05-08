//
//  Change cookies.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 25/12/2023.
//

import SwiftUI

struct ChangeCookies: View {
    
    @State private var showAlert = false
    @State private var tempSelectedCookie = ""
    
    var body: some View {
        NavigationStack {
            Form {
                
                HStack {
                    Image("Cookie")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    Button {
                        tempSelectedCookie = "Cookie:600"
                        showAlert = true
                    } label: {
                        Text("Original Cookie")
                    }
                }
                HStack {
                    Image("MillenniumFalcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .padding(10)
                    Button {
                        tempSelectedCookie = "MillenniumFalcon:600"
                        showAlert = true
                    } label: {
                        Text("Millennium Falcon")
                    }
                }
                HStack {
                    Image("Oreo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90)
                        .padding(5)
                    Button {
                        tempSelectedCookie = "Oreo:600"
                        showAlert = true
                    } label: {
                        Text("Oreo Cookie")
                    }
                }
                HStack {
                    Image("Donut")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90)
                        .padding(5)
                    Button {
                        tempSelectedCookie = "Donut:500"
                        showAlert = true
                    } label: {
                        Text("Donut")
                    }
                }
                .navigationTitle("Change Cookies")
                .alert(isPresented: $showAlert, content: {
                    Alert(
                        title: Text("Change Cookie"),
                        message: Text("Do you want to change the cookie to \(tempSelectedCookie.replacingOccurrences(of: "_", with: " "))?"),
                        primaryButton: .default(Text("Yes")) {
                            UserDefaults.standard.set(tempSelectedCookie, forKey: UserDefaultsCookie.selectedCookieImage)
                        },
                        secondaryButton: .cancel()
                    )
                })
            }
        }
    }
}

#Preview {
    ChangeCookies()
}

struct UserDefaultsCookie {
    static let selectedCookieImage = "selectedCookieImage"
}
