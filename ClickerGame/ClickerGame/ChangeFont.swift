//
//  Change cookies.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 25/12/2023.
//

import SwiftUI

struct ChangeFont: View {
    
    @State private var showAlert = false
    @State private var tempSelectedFont = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Button {
                    tempSelectedFont = "HelveticaNeue"
                    showAlert = true
                } label: {
                    Text("Original")
                        .modifier(CustomFontModifier(fontName: "HelveticaNeue"))
                }
                
                Button {
                    tempSelectedFont = "PressStart2P-Regular"
                    showAlert = true
                } label: {
                    Text("PressStart2P")
                        .modifier(CustomFontModifier(fontName: "PressStart2P-Regular"))
                }
                Button {
                    tempSelectedFont = "SuperPeach"
                    showAlert = true
                } label: {
                    Text("Super Peach")
                        .modifier(CustomFontModifier(fontName: "SuperPeach"))
                }
                Button {
                    tempSelectedFont = "neon"
                    showAlert = true
                } label: {
                    Text("Neon")
                        .modifier(CustomFontModifier(fontName: "neon"))
                }
                Button {
                    tempSelectedFont = "NeonSans"
                    showAlert = true
                } label: {
                    Text("Neon Sans")
                        .modifier(CustomFontModifier(fontName: "NeonSans"))
                }
                Button {
                    tempSelectedFont = "Neon Rave"
                    showAlert = true
                } label: {
                    Text("Neon Rave")
                        .modifier(CustomFontModifier(fontName: "Neon Rave"))
                }
                
                Button {
                    tempSelectedFont = "soloist"
                    showAlert = true
                } label: {
                    Text("Star Wars")
                        .modifier(CustomFontModifier(fontName: "soloist"))
                }
                Button {
                    tempSelectedFont = "Simpsonfont"
                    showAlert = true
                } label: {
                    Text("Simpsons")
                        .font(.custom("Simpsonfont", size: 30))
                }
                
                .navigationTitle("Change Font")
                .alert(isPresented: $showAlert, content: {
                    Alert(
                        title: Text("Change Font"),
                        message: Text("Do you want to change the font to \(tempSelectedFont.replacingOccurrences(of: "_", with: " "))?"),
                        primaryButton: .default(Text("Yes")) {
                            UserDefaults.standard.set(tempSelectedFont, forKey: UserDefaultsFont.selectedFont)
                        },
                        secondaryButton: .cancel()
                    )
                })
            }
        }
    }
}

#Preview {
    ChangeFont()
}

struct UserDefaultsFont {
    static let selectedFont = "selectedFont"
}
