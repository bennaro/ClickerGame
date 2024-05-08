import SwiftUI
import SwiftData

struct ProfileView: View {
    
    @AppStorage("count") var count: Double = 0.0
    @AppStorage(UserDefaultsFont.selectedFont) var selectedFont: String = "HelveticaNeue"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Original Background")
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                    Color(.white)
                    Image("MillenniumFalcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    }
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    
                    Text("Username")
                        .modifier(CustomFontModifier(fontName: selectedFont))
                    
                    HStack {
                        Text("Current Cookies:")
                            .bold()
                        Text(String(format: "%.2f", count))
                    }
                    Spacer()
                    
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
