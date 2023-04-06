//
//  OnBoarding.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 04/04/23.
//

import SwiftUI

struct OnBoarding: View {
    
    @StateObject private var viewModel = GenericViewModel()
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                Hero(searchText: .constant("")).environmentObject(viewModel)
                    .frame(maxWidth: .infinity, maxHeight: 240).padding(.bottom,2)
                
                VStack{
                    
                    
                    NavigationLink(destination: Home().environmentObject(viewModel), isActive: $viewModel.isLoggedIn){ EmptyView() }
                    Text("First Name").textStyle()
                    TextField("First Name", text: $firstName)
                    Text("Last Name").textStyle()
                    TextField("Last Name", text: $lastName)
                    Text("Email").textStyle()
                    TextField("Email", text: $email)
                    
                   
                    
                    Button("Register"){
                        if(viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: "")){
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            UserDefaults.standard.set(true, forKey: kOrderStatuses)
                            UserDefaults.standard.set(true, forKey: kPasswordChanges)
                            UserDefaults.standard.set(true, forKey: kSpecialOffers)
                            UserDefaults.standard.set(true, forKey: kNewsletter)
                            firstName = ""
                            lastName = ""
                            email = ""
                            viewModel.isLoggedIn = true
                            
                        }
                    }
                    .buttonStyle(ButtonStyleWide())
                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding(8)
                
                .onAppear(){
                    var isLogged = UserDefaults.standard.bool(forKey: kIsLoggedIn);
                    if(isLogged){
                        viewModel.isLoggedIn = true
                    }
                }
                .alert("Warning", isPresented: $viewModel.errorMessageShow, actions: {}, message: {
                    Text(viewModel.errorMessage)
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        
         
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
