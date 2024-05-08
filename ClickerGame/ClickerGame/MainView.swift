import SwiftUI

struct MainView: View {
    @StateObject var authManager = AuthManager()

    var body: some View {
        if authManager.isAuthenticated {
            // Your main app view
            TabBarView()
                .environmentObject(authManager)
        } else {
            // Show login view
            LoginView()
                .environmentObject(authManager)
        }
    }
}

#Preview {
    MainView()
}
