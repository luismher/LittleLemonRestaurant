//
//  UserProfile.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import SwiftUI
import SwiftData

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.presentationMode) var presentation
    
    @State private var isLoggedOut = false
    
    @State private var profileImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    @State private var saveChanges = false
    @AppStorage("profileImageData") var profileImageData: Data?
    @FocusState private var keyboardIsFocused: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ZStack {
                    NavigationLink (destination: Onboarding(), isActive: $isLoggedOut) {}
                    NavigationLink(destination: Home(), isActive: $saveChanges) {}
                    VStack (spacing: 5) {
                        VStack {
                            Text("Personal Information")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            HStack{
                                if let image = profileImage {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                        .padding()
                                } else { Image("Profile")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                        .padding()
                                }
                                Button("Change"){
                                    isShowingImagePicker = true

                                }.buttonStyle(buttonGreen())
                                Button ("Remove"){
                                    profileImage = nil
                                }
                                .buttonStyle(buttonWhite())
                                Spacer()
                            }.sheet(isPresented: $isShowingImagePicker) {
                                ImagePicker(image: $profileImage, isPresented: $saveChanges)}
                            Text("First Name")
                                .onboardingText()
                            TextField("First Name", text: $viewModel.firstName)
                                .focused($keyboardIsFocused)

                            Text("Last Name")
                                .onboardingText()
                            TextField("Last Name", text: $viewModel.lastName)
                                .focused($keyboardIsFocused)
                            
                            Text("Email")
                                .onboardingText()
                            TextField("Email", text: $viewModel.email)
                                .keyboardType(.emailAddress)
                                .focused($keyboardIsFocused)

                            Text("Phone")
                                .onboardingText()
                            TextField("Phone Number", text: $viewModel.phoneNumber)
                                .keyboardType(.numberPad)
                                .focused($keyboardIsFocused)
                        }
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                        .padding()
                        
                        Text("Email notifications")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        VStack {
                            Toggle("Order Status", isOn: $viewModel.orderStatuses)
                            Toggle("Password changes", isOn: $viewModel.passwordChanges)
                            Toggle("Special offers", isOn: $viewModel.specialOffers)
                            Toggle("Newsletter", isOn: $viewModel.newsletter)
                        }
                        .padding()
                        .font(Font.leadText())
                        .foregroundColor(.primaryColor1)
                        Button("Log out") {
                            UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                            UserDefaults.standard.set("", forKey: "first key")
                            UserDefaults.standard.set("", forKey: "last key")
                            UserDefaults.standard.set("", forKey: "email key")
                            UserDefaults.standard.set("", forKey: "phone Key")
                            UserDefaults.standard.set(false, forKey: "order key")
                            UserDefaults.standard.set(false, forKey: "password key")
                            UserDefaults.standard.set(false, forKey: "special key")
                            UserDefaults.standard.set(false, forKey: "newsletter key")
                            isLoggedOut = true
                        }
                        
                        .buttonStyle(buttonYellow())
                        HStack {
                            Button("Discard Changes") {
                                viewModel.firstName = originalFirstName
                                viewModel.lastName = originalLastName
                                viewModel.email = originalEmail
                                viewModel.phoneNumber = originalPhoneNumber
                                viewModel.orderStatuses = originalOrderStatuses
                                viewModel.passwordChanges = originalPasswordChanges
                                viewModel.specialOffers = originalSpecialOffers
                                viewModel.newsletter = originalNewsletter
                                saveChanges = true
                            }
                            .buttonStyle(buttonWhite())
                            
                            Button("Save changes") {
                                UserDefaults.standard.setValue(viewModel.firstName, forKey: "first key")
                                UserDefaults.standard.setValue (viewModel.lastName, forKey: "last key")
                                UserDefaults.standard.setValue(viewModel.email, forKey: "email key")
                                UserDefaults.standard.set(viewModel.phoneNumber, forKey: "phone key")
                                UserDefaults.standard.set(viewModel.orderStatuses, forKey: "order key")
                                UserDefaults.standard.set(viewModel.passwordChanges, forKey: "password key")
                                UserDefaults.standard.set(viewModel.specialOffers, forKey: "special key")
                                UserDefaults.standard.set(viewModel.newsletter, forKey: "newsletter key")
                                saveChanges = true

                            }
                            .buttonStyle(buttonGreen())
                        }
                        .padding(.top)
                        
                    }
                }
                if viewModel.errorMessageShow {
                    withAnimation() {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                }
            }
            .onAppear {
                
                originalPhoneNumber = UserDefaults.standard.string(forKey: "phone key") ?? ""
                originalOrderStatuses = UserDefaults.standard.bool(forKey: "order key")
                originalPasswordChanges = UserDefaults.standard.bool(forKey: "password key")
                originalSpecialOffers = UserDefaults.standard.bool(forKey: "special key")
                originalNewsletter = UserDefaults.standard.bool(forKey: "newsletter key")
                
                
                viewModel.firstName = UserDefaults.standard.string(forKey: "first key") ?? ""
                viewModel.lastName = UserDefaults.standard.string(forKey: "last key") ?? ""
                viewModel.email = UserDefaults.standard.string(forKey: "email key") ?? ""
                viewModel.phoneNumber = originalPhoneNumber
                viewModel.orderStatuses = originalOrderStatuses
                viewModel.passwordChanges = originalPasswordChanges
                viewModel.specialOffers = originalSpecialOffers
                viewModel.newsletter = originalNewsletter
                if let imageData = profileImageData {
                                   profileImage = UIImage(data: imageData)
                    }
                }
            }
        .navigationTitle("")
        .toolbar {
            if keyboardIsFocused{
                Button ("Done"){
                    keyboardIsFocused = false
                }
            }
        }
    }
}
#Preview {
    UserProfile().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
