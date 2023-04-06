//
//  UserProfile.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 04/04/23.
//

import SwiftUI



struct UserProfile: View {
    @StateObject private var viewModel = GenericViewModel()
    @Environment(\.presentationMode) var presentation
    
   
    @State private var isLoggedOut = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            NavigationLink(destination: OnBoarding(), isActive: $isLoggedOut) { }
            VStack(spacing: 5) {
                VStack {
                    Text("Avatar")
                        .textStyle()
                    HStack(spacing: 0) {
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Button("Change") { }
                            .buttonStyle(ButtonStylePrimaryColor1())
                        Button("Remove") { }
                            .buttonStyle(ButtonStylePrimaryColorReverse())
                        Spacer()
                    }
                }
                
                VStack{
                    Text("First name")
                        .textStyle()
                    TextField("First Name", text: $viewModel.firstName)
                }
                
                VStack {
                    Text("Last name")
                        .textStyle()
                    TextField("Last Name", text: $viewModel.lastName)
                    
                }
                
                VStack {
                    Text("E-mail")
                        .textStyle()
                    TextField("E-mail", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                }
                
                VStack {
                    Text("Phone number")
                        .textStyle()
                    TextField("Phone number", text: $viewModel.phoneNumber)
                        .keyboardType(.phonePad)
                }
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            
            Text("Email notifications")
                .font(.regularText())
                .foregroundColor(.primaryColor1)
            VStack {
                Toggle("Order statuses", isOn: $viewModel.orderStatuses)
                Toggle("Password changes", isOn: $viewModel.passwordChanges)
                Toggle("Special offers", isOn: $viewModel.specialOffers)
                Toggle("Newsletter", isOn: $viewModel.newsletter)
            }
            .padding()
            .font(Font.leadText())
            .foregroundColor(.primaryColor1)
            
            Button("Log out") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                UserDefaults.standard.set("", forKey: kPhoneNumber)
                UserDefaults.standard.set(false, forKey: kOrderStatuses)
                UserDefaults.standard.set(false, forKey: kPasswordChanges)
                UserDefaults.standard.set(false, forKey: kSpecialOffers)
                UserDefaults.standard.set(false, forKey: kNewsletter)
                isLoggedOut = true
                viewModel.isLoggedIn = false
                PersistenceController.shared.clear("Dish")
            }
            .buttonStyle(ButtonStyleWide())
            .padding()
            
            Spacer(minLength: 20)
            HStack {
                Button("Discard Changes") {
                    self.presentation.wrappedValue.dismiss()
                }
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                Button("Save changes") {
                    if viewModel.validateUserInput(firstName: viewModel.firstName, lastName: viewModel.lastName, email: viewModel.email, phoneNumber: viewModel.phoneNumber) {
                        UserDefaults.standard.set(viewModel.firstName, forKey: kFirstName)
                        UserDefaults.standard.set(viewModel.lastName, forKey: kLastName)
                        UserDefaults.standard.set(viewModel.email, forKey: kEmail)
                        UserDefaults.standard.set(viewModel.phoneNumber, forKey: kPhoneNumber)
                        UserDefaults.standard.set(viewModel.orderStatuses, forKey: kOrderStatuses)
                        UserDefaults.standard.set(viewModel.passwordChanges, forKey: kPasswordChanges)
                        UserDefaults.standard.set(viewModel.specialOffers, forKey: kSpecialOffers)
                        UserDefaults.standard.set(viewModel.newsletter, forKey: kNewsletter)
                        
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                    .buttonStyle(ButtonStylePrimaryColor1())
            }
           
            
        }
        .alert("Warning", isPresented: $viewModel.errorMessageShow, actions: {}, message: {
            Text(viewModel.errorMessage)
        })
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
