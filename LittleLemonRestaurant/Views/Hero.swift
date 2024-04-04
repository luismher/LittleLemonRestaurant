//
//  Hero.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    
                    Text("Little Lemon")
                        .font(.displayTitle())
                        .foregroundColor(.primaryColor2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Chicago")
                        .font(.subTitle())
                        .foregroundColor(.secondaryColor3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Text("""
                    We are a family owned Mediterranean restaurant,focused on traditional recipes served with a modern twist.
                    """)
                    .foregroundColor(Color.secondaryColor3)
                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                }.padding()
              
                
                Image("Hero image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 100, maxHeight: 120)
                    .clipShape(Rectangle())
                    .cornerRadius(20)
                    .padding()
            }
            
        } .background(Color.primaryColor1)
            .frame(maxWidth: .infinity, maxHeight: 200)
    }
}
    
#Preview {
    Hero()
}
