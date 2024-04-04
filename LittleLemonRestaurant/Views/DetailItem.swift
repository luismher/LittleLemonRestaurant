//
//  DetailItem.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import SwiftUI

struct DetailItem: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let dish: Dish
    
    var body: some View {
        VStack { Header()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding(.horizontal, 50)
                .padding(-30)

            ZStack {
                    Color.white
                    .ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading, spacing: 30.0)  {
                       
                        AsyncImage(url: URL(string: dish.image ?? "")){
                            image in image
                                .image?
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20)
                            
                            Text(dish.title ?? "")
                                .font(.cardTitle())
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .padding()
                            Text(dish.descriptionDish ?? "")
                                .font(.paragraphText())
                                .foregroundColor(Color.primaryColor1)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("$" + (dish.price ?? ""))
                                .font(.cardTitle())
                                .padding()
                                .foregroundColor(Color.primaryColor1)
                        }
                    }.padding()
                        .background(Rectangle().foregroundColor(Color.secondaryColor3))
                        .cornerRadius(15)
                        .shadow (radius: 15)
                        .padding()
                }
            }.padding()
        }
    }
}

#Preview {
    DetailItem(dish: PersistenceController.oneDish())
}

