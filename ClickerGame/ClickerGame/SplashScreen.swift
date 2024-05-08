
import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var rotation = -90.0
    @State private var offsetY: CGFloat = -400
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            ZStack {
                Color("Original Background")
                    .ignoresSafeArea()
                
                VStack {
                    
                    Image("Cookie")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .rotationEffect(Angle(degrees: rotation))
                        .onAppear {
                            withAnimation(Animation.bouncy(duration: 2.0)) {
                                self.rotation = 360
                            }
                        }
                
                    Text("Loading...")
                        .foregroundColor(.white)
                        .bold()
                        .font(.custom("soloist", size: 30))
                }
                
            }
            // Delayed transition to the next screen
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
