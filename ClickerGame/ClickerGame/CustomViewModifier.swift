import SwiftUI

struct FontStyling {
    var size: CGFloat
    var weight: Font.Weight
    var color: Color
    var shadow: Color?
    var shadowRadius: Int?
}

struct CustomFontModifier: ViewModifier {
    var fontName: String
    
    func body(content: Content) -> some View {
        let styling = fontStyling(for: fontName)
        
        return content
            .font(.custom(fontName, size: styling.size))
            .fontWeight(styling.weight)
            .foregroundColor(styling.color)
            .shadow(color: styling.shadow ?? .clear, radius: CGFloat(styling.shadowRadius ?? 1) )
    }
    
    private func fontStyling(for fontName: String) -> FontStyling {
        switch fontName {
        case "HelveticaNeue":
            return FontStyling(
                size: 50,
                weight: .bold,
                color: .white,
                shadow: .black
            )
        case "PressStart2P-Regular":
            return FontStyling(
                size: 30,
                weight: .medium,
                color: .red
            )
        case "neon":
            return FontStyling(
                size: 80,
                weight: .light,
                color: .mint,
                shadow: .mint,
                shadowRadius: 5
            )
        case "Neon Rave":
            return FontStyling(
                size: 50,
                weight: .light,
                color: .pink,
                shadow: .black
            )
        case "NeonSans":
            return FontStyling(
                size: 60,
                weight: .light,
                color: .pink,
                shadow: .pink,
                shadowRadius: 7
            )
        case "SuperPeach":
            return FontStyling(
                size: 60,
                weight: .light,
                color: .orange
            )
        case "soloist":
            return FontStyling(
                size: 50,
                weight: .light,
                color: .yellow,
                shadow: .black
            )
        case "Simpsonfont":
            return FontStyling(
                size: 50,
                weight: .light,
                color: .yellow,
                shadow: .black
            )
        default:
            return FontStyling(size: 30, weight: .bold, color: .white, shadow: .black)
        }
    }
}


struct CustomFontModifier_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Original Background")
            VStack {
                Text("Original")
                    .modifier(CustomFontModifier(fontName: "HelveticaNeue"))
                
                Text("PressStart2P")
                    .modifier(CustomFontModifier(fontName: "PressStart2P-Regular"))
                
                Text("Neon")
                    .modifier(CustomFontModifier(fontName: "neon"))
                
                Text("Neon Rave")
                    .modifier(CustomFontModifier(fontName: "Neon Rave"))
                
                Text("Neon Sans")
                    .modifier(CustomFontModifier(fontName: "NeonSans"))
                
                Text("Super Peach")
                    .modifier(CustomFontModifier(fontName: "SuperPeach"))
                
                Text("Star Wars")
                    .modifier(CustomFontModifier(fontName: "soloist"))
                Text("Simpsons")
                    .modifier(CustomFontModifier(fontName: "Simpsonfont"))
            }
        }
    }
}   


