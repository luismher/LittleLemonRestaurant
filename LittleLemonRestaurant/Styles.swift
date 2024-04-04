//
//  Styles.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//
import SwiftUI


extension Text {
    func onboardingText() -> some View {
        
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.custom("Karla-bold", size: 12))
    }
    
}

struct buttonYellow: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.secondaryColor3 : Color.secondaryColor4)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct buttonGreen: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.primaryColor1 : Color.secondaryColor3)
            .frame(maxWidth: .infinity)
            .font(.sectionCategories())
            .padding(10)
            .background(configuration.isPressed ? Color.secondaryColor3 : Color.primaryColor1)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct buttonWhite: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.secondaryColor3 : Color.secondaryColor4)
            .frame(maxWidth: .infinity)
            .font(.sectionCategories())
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.secondaryColor3)
            .cornerRadius(8)
            .padding(.horizontal)
    }

}



struct buttonWhiteCategory: ButtonStyle {
    @State private var isPrimaryColor = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.secondaryColor3 : Color.secondaryColor4)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.secondaryColor3)
            .cornerRadius(8)
            .padding(.horizontal)
            .onTapGesture {self.isPrimaryColor.toggle()}
    }
}


struct ButtonFilterCategory: ButtonStyle {
    @State var isPressed = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(isPressed ? Color.secondaryColor3 : Color.secondaryColor4)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(isPressed ? Color.primaryColor1 : Color.secondaryColor3)
            .cornerRadius(8)
            .padding(.horizontal)
            .onTapGesture {self.isPressed.toggle()}
           
    }
}

struct ToggleCategoty: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(configuration.isOn ? Color.primaryColor1 : Color.secondaryColor3)
        .padding(5)
        .background(configuration.isOn ? Color.secondaryColor3 : Color.primaryColor1)
        .cornerRadius(8)
    }
}

extension Color {
    static let primaryColor1 = Color(#colorLiteral(red: 0.1520302594, green: 0.2883823514, blue: 0.2530374229, alpha: 1))
    static let primaryColor2 = Color(#colorLiteral(red: 0.9901360869, green: 0.8065934777, blue: 0.1990449727, alpha: 1))
    static let secondaryColor1 = Color(#colorLiteral(red: 0.9298431277, green: 0.602404058, blue: 0.4085996747, alpha: 1))
    static let secondaryColor2 = Color(#colorLiteral(red: 0.9812934995, green: 0.7741494775, blue: 0.6925613284, alpha: 1))
    static let secondaryColor3 = Color(#colorLiteral(red: 0.9409594536, green: 0.9528051019, blue: 0.9525968432, alpha: 1))
    static let secondaryColor4 = Color(#colorLiteral(red: 0.2465105951, green: 0.2677562833, blue: 0.2963502705, alpha: 1))
}

extension Font {
    static func displayTitle() -> Font {
        return Font.custom("Markazi Text", size: 38) .weight(.bold)
    }
    static func subTitle() -> Font {
        return Font.custom("Markazi Text", size: 30) .weight(.regular)
    }
    static func leadText() -> Font {
        return Font.custom("Karla", size: 14) .weight(.medium)
    }
    static func sectionTitle() -> Font {
        return Font.custom("Karla", size: 18) .weight(.black)
    }
    static func sectionCategories() -> Font {
        return Font.custom("Karla", size: 12) .weight(.bold)
    }
    static func cardTitle() -> Font {
        return Font.custom("Karla", size: 24) .weight(.bold)
    }
    static func paragraphText() -> Font {
        return Font.custom("Karla", size: 20) .weight(.regular)
    }
    static func highLightText() -> Font {
        return Font.custom("Karla", size: 16)
    }
}
