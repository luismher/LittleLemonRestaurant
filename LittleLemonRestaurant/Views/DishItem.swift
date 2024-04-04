//
//  DishItem.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import SwiftUI

struct DishItem: View {
    
    let dish: Dish
    
    var body: some View {
        HStack{
            
            VStack{
                
                Text(dish.title ?? "")
                    .font(.sectionTitle())
                    .frame (maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 5)
                Text(dish.descriptionDish ?? "")
                    .font(.sectionCategories())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.primaryColor1)
                    .lineLimit(2)
                    .padding(.bottom, 8)
                Text("$" + (dish.price ?? ""))
                    .font(.sectionCategories())
                    .frame (maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primaryColor1)
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 80, maxHeight: 80)
            .cornerRadius(10)

        }.frame(maxHeight: 180, alignment: .leading)
        .padding(.vertical)
        
    }
}

#Preview {
    DishItem(dish: PersistenceController.oneDish())
}
