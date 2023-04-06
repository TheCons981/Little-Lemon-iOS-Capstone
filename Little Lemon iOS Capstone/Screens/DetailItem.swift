//
//  DetailItem.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 05/04/23.
//

import SwiftUI

struct DetailItem: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let dish: Dish
    
    var body: some View {
        
        ScrollView{
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(dish.title ?? "")
                .font(.subTitleFont())
                .foregroundColor(.primaryColor1)
            Spacer(minLength: 20)
            Text(dish.intro ?? "")
                .font(.regularText())
            Spacer(minLength: 10)
            Text("$ \(dish.price ?? "0")")
                .font(.highlightText())
                .foregroundColor(.primaryColor1)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .navigationTitle(Text((dish.category ?? "") + ": " + (dish.title ?? "")))
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailItem(dish: PersistenceController.oneDish())
    }
}
