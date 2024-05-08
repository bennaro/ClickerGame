//
//  AuthManager.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 25/12/2023.
//

import Foundation
import SwiftData

class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    
    func login(username: String, password: String) {
        isAuthenticated = true
    }

    func logout() {
        isAuthenticated = false
    }
}
