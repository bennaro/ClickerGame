//
//  User.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 25/12/2023.
//

import SwiftData
import SwiftUI

@Model
final class User {
    var userName: String
    var password: String
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
}
