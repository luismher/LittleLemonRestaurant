//
//  Logo.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 4/2/24.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        HStack{
            Image("Logo")
                .aspectRatio(contentMode: .fit)
        }
        .padding(.bottom)
        .onAppear()
    }
}

#Preview {
    Logo()
}
