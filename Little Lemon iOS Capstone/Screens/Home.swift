//
//  Home.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 04/04/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject private var viewModel: GenericViewModel
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        NavigationView{
            
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .environmentObject(viewModel)
        }
        /*TabView{
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem() {
                Label("Menu", systemImage: "list.dash")
            }
            UserProfile().tabItem() {
                Label("Profile", systemImage: "square.and.pencil")
            }
        }*/
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    
   
    static var previews: some View {
        Home().environmentObject(GenericViewModel())
    }
}
