//
//  Header.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import SwiftUI
import Foundation
import UIKit

struct Header: View {
   
    @State private var profileImage: UIImage? = UIImage(named: "Profile")
    var body: some View {
        HStack{
            Image("Logo")
                .aspectRatio(contentMode: .fit)
        
            if let image = profileImage {
                           Image(uiImage: image)
                               .resizable()
                               .frame(width: 75, height: 75)
                               .clipShape(Circle())
                               .padding()
                       }
                       
        
        }
        .padding(.bottom)
        .onAppear()
    }
}

#Preview {
    Header()
}
