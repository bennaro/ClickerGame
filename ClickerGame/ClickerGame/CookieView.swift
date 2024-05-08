import SwiftUI
import Combine  // Import Combine for AnyCancellable

extension View {
    func eraseToAnyView() -> AnyView { AnyView(self) }
}

struct CookieView: View {
    @AppStorage("count") var count: Double = 0.0
    @AppStorage("clickIncrement") var clickIncrement: Double = 1.0
    @AppStorage("autoClickRate") var autoClickRate: Double = 0.0
    @AppStorage("autoClickerInterval") var autoClickerInterval: Double = 1.0
    @AppStorage(UserDefaultsCookie.selectedCookieImage) var selectedCookieImage: String = "Cookie"
    @AppStorage(UserDefaultsBackground.selectedBackground) var selectedBackground: String = "Original Background"
    @AppStorage(UserDefaultsFont.selectedFont) var selectedFont: String = "HelveticaNeue"
    
    @State private var degreesRotating = 0.0
    @State private var isAnimating = false
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    @State private var cancellable: AnyCancellable?
    
    private func backgroundView() -> some View {
        if selectedBackground.hasPrefix("color:") {
            let colorName = String(selectedBackground.dropFirst(6)) // Removes "color:"
            return Color(colorName).ignoresSafeArea().eraseToAnyView()
        } else if selectedBackground.hasPrefix("image:") {
            let imageName = String(selectedBackground.dropFirst(6)) // Removes "image:"
            return Image(imageName).resizable().ignoresSafeArea().eraseToAnyView()
        } else {
            // Default background
            return Color("Original Background").ignoresSafeArea().eraseToAnyView()
        }
    }
    
    
    private func startTimer() {
        cancellable?.cancel() // Cancel previous timer
        timer = Timer.publish(every: autoClickerInterval, on: .main, in: .common)
        cancellable = timer.autoconnect().sink { _ in
            self.count += self.autoClickRate
        }
    }
    
    var body: some View {
        let cookieComponents = selectedCookieImage.components(separatedBy: ":")
        let cookieImage = cookieComponents.first ?? "DefaultImage"
        let cookieSize = CGFloat(Double(cookieComponents.last ?? "100") ?? 100.0)
        
        ZStack {
            // Background color, safe area handling, etc.
            backgroundView()
                .ignoresSafeArea()
            
            VStack {
                // Cookie count display
                Text(String(format: "%.2f", count))
                    .offset(x: 0, y: 80)
                    .modifier(CustomFontModifier(fontName: selectedFont))
                
                
                // Cookie button
                Button(action: {
                    // Increase the count by the value from ShoppingView
                    self.count += self.clickIncrement
                    self.isAnimating = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.isAnimating = false
                    }
                }) {
                    Image(cookieImage) // Ensure this image is in your assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: cookieSize, height: cookieSize)
                        .rotationEffect(.degrees(degreesRotating))
                        .scaleEffect(isAnimating ? 1.1 : 1.0)
                    
                }
                .onAppear {
                    withAnimation(.linear(duration: 1).speed(0.1).repeatForever(autoreverses: false)) {
                        degreesRotating = 360.0
                    }
                    startTimer()
                }
                .onChange(of: autoClickerInterval)  {
                    startTimer()
                }
            }
        }
    }
}

struct CookieView_Previews: PreviewProvider {
    static var previews: some View {
        CookieView()
            .onAppear {
                UserDefaults.standard.set("Cookie:600", forKey: UserDefaultsCookie.selectedCookieImage)
                UserDefaults.standard.set("Original Background:600", forKey: UserDefaultsBackground.selectedBackground)
                UserDefaults.standard.set("HelveticaNeue", forKey: UserDefaultsFont.selectedFont)
            }
    }
}
