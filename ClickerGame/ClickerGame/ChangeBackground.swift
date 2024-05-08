//
//  Change cookies.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 25/12/2023.
//

import SwiftUI

struct ChangeBackground: View {
    
    @State private var showAlert = false
    @State private var tempSelectedBackground = ""
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Color("Original Background")
                        .frame(width: 80, height: 80)
                    Button {
                        tempSelectedBackground = "color:Original Background"
                        showAlert = true
                    } label: {
                        Text("Original Background")
                    }
                }
                HStack {
                    Color("RedBackground")
                        .frame(width: 80, height: 80)
                    Button {
                        tempSelectedBackground = "color:Red"
                        showAlert = true
                    } label: {
                        Text("Red")
                    }
                }
                HStack {
                    Color("GreenBackground")
                        .frame(width: 80, height: 80)
                    Button {
                        tempSelectedBackground = "color:Green"
                        showAlert = true
                    } label: {
                        Text("Green")
                    }
                }
                HStack {
                    Color("YellowBackground")
                        .frame(width: 80, height: 80)
                    Button {
                        tempSelectedBackground = "color:Yellow"
                        showAlert = true
                    } label: {
                        Text("Yellow")
                    }
                }
                HStack {
                    Image("CookieBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                    Button {
                        tempSelectedBackground = "image:CookieBackground"
                        showAlert = true
                    } label: {
                        Text("Cookie Background")
                    }
                }
                HStack {
                    Image("SpaceBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    Button {
                        tempSelectedBackground = "image:SpaceBackground"
                        showAlert = true
                    } label: {
                        Text("Space Background")
                    }
                }
                HStack {
                    Image("OreoBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    Button {
                        tempSelectedBackground = "image:OreoBackground"
                        showAlert = true
                    } label: {
                        Text("Oreo Background")
                    }
                }
                HStack {
                    Image("SimpsonsBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    Button {
                        tempSelectedBackground = "image:SimpsonsBackground"
                        showAlert = true
                    } label: {
                        Text("Simpsons Background")
                    }
                }
                .navigationTitle("Change Background")
                .alert(isPresented: $showAlert, content: {
                    Alert(
                        title: Text("Change Background"),
                        message: Text("Do you want to change the background to \(tempSelectedBackground.replacingOccurrences(of: "_", with: " "))?"),
                        primaryButton: .default(Text("Yes")) {
                            UserDefaults.standard.set(tempSelectedBackground, forKey: UserDefaultsBackground.selectedBackground)
                        },
                        secondaryButton: .cancel()
                    )
                })
            }
        }
    }
}

#Preview {
    ChangeBackground()
}

struct UserDefaultsBackground {
    static let selectedBackground = "selectedBackground"
}

