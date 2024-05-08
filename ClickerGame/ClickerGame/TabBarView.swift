import SwiftUI

struct TabBarView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
    }
    
    var body: some View {
        TabView {
            ShoppingView() // Pass the binding to ShoppingView
                .tabItem { Label("Shop", systemImage:"cart") }
            
            CookieView()
                .tabItem { Label("Cookie", systemImage:"hand.point.up.left.fill") }
            
            SettingsView()
                .tabItem { Label("Settings", systemImage:"gearshape.fill") }
        }
        .accentColor(.orange)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
