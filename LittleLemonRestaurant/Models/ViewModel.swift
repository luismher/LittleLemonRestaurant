//
//  ViewModel.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//


import Foundation
import Combine



public let kIsLoggedIn = "kIsLoggedIn"
public var originalFirstName = ""
public var originalLastName = ""
public var originalEmail = ""
public var originalPhoneNumber = ""
public var originalOrderStatuses = false
public var originalPasswordChanges = false
public var originalSpecialOffers = false
public var originalNewsletter = false


class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: "first key") ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: "last key") ?? ""
    @Published var email = UserDefaults.standard.string(forKey: "email key") ?? ""
    @Published var phoneNumber = UserDefaults.standard.string(forKey: "phone key") ?? ""
    
    @Published var orderStatuses = UserDefaults.standard.bool(forKey: "order key")
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: "password key")
    @Published var specialOffers = UserDefaults.standard.bool(forKey: "special key")
    @Published var newsletter = UserDefaults.standard.bool(forKey: "newsletter key")
    
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    @Published var searchText = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String, phoneNumber: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required"
            errorMessageShow = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        guard phoneNumber.first == "+" && phoneNumber.dropFirst().allSatisfy({$0.isNumber}) || phoneNumber.isEmpty else {
            errorMessage = "Invalid phone number format."
            errorMessageShow = true
            return false
        }
        errorMessageShow = false
        errorMessage = ""
        return true
    }
}


