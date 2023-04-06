//
//  Header.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 05/04/23.
//

import SwiftUI

struct Header: View {
    
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack{
            
            
            ZStack{
                
                Image("littleLemon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                    .frame(maxHeight: 60, alignment: .center)
                    
                HStack {
                    Spacer()
                    NavigationLink(destination: UserProfile()) {
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 60, alignment: .trailing)
                            .clipShape(Circle())
                            .padding(.trailing,2)
                            
                    }
                }
                    
                
            }
           
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                } else {
                    isLoggedIn = false
                }
            }
        }
      
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
