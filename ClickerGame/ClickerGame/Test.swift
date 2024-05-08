//
//  Test.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 26/12/2023.
//

import SwiftUI

struct Test: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.custom("PressStart2P-Regular", size: 32))
    }
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)")
            }
        }
    }
}

#Preview {
    Test()
}
