//
//  LittleLemonRestaurantApp.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import SwiftUI

@main
struct LittleLemonRestaurantApp: App {
    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
