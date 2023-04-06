//
//  Hero.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 05/04/23.
//

import SwiftUI

struct Hero: View {
    
    @EnvironmentObject private var viewModel: GenericViewModel
    @Binding var searchText: String

    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryColor2)
                        .fontWeight(.bold)
                        .font(.displayFont())
                    
                    Text("Chicago")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.subTitleFont())
                        .padding(.bottom,2)
                    Text("""
                         We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                         """)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                    .font(.leadText())
                    
                   
                }
                Spacer()
                
                Image("hero-image")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)

            }
            if viewModel.isLoggedIn{
                TextField("Search menu", text: $searchText).textFieldStyle(.roundedBorder)
            }
        }
        .padding(8)
        .background(Color.primaryColor1)
        
        
        
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero(searchText: .constant("")).environmentObject(GenericViewModel())
    }
}
