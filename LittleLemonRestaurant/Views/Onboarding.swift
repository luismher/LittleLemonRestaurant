//
//  Onboarding.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import SwiftUI


struct Onboarding: View {
    
    @StateObject private var viewModel = ViewModel()
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var isLoggedIn = false
    @FocusState private var keyboardIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Logo()
                    .padding(.bottom)
                Hero()
                
                VStack{
                    
                    NavigationLink (destination: Home(), isActive: $isLoggedIn) {
                    }
                    Text("First Name *")
                        .onboardingText()
                    TextField("First Name", text: $firstName)
                        .focused($keyboardIsFocused)

                    Text("Last Name *")
                        .onboardingText()
                    TextField("Last Name", text: $lastName)
                        .focused($keyboardIsFocused)

                    Text("Email *")
                        .onboardingText()
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .focused($keyboardIsFocused)

                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                
                
                Button("Register") {
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                        UserDefaults.standard.set(firstName, forKey: "first key")
                        UserDefaults.standard.set(lastName, forKey: "last key")
                        UserDefaults.standard.set(email, forKey: "email key")
                        UserDefaults.standard.set(phoneNumber, forKey: "phone key")
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        UserDefaults.standard.set(true, forKey: "order key")
                        UserDefaults.standard.set(true, forKey: "password key")
                        UserDefaults.standard.set(true, forKey: "special key")
                        UserDefaults.standard.set(true, forKey: "newsletter key")
                        firstName = ""
                        lastName = ""
                        email = ""
                        isLoggedIn = true
                    }
                }
                .buttonStyle(buttonYellow())
                
                Spacer()
            }
            .onAppear(){if UserDefaults.standard.bool(forKey: kIsLoggedIn) {isLoggedIn = true}  }
            .toolbar {
                if keyboardIsFocused{
                    Button ("Done"){
                        keyboardIsFocused = false
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        
    }
}

 
#Preview {
    Onboarding()
}
