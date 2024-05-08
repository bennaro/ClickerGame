//
//  Settings.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 24/12/2023.
//

import SwiftUI

struct CookieView: View {
    
    @State var count: Int = 1
    
    var body: some View {
        Text("\(count)")
            .fontWeight(.bold)
            .font(.largeTitle)
        
        Button {
            self.count += 1
        } label: {
        Image("Cookie")
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    CookieView()
}
