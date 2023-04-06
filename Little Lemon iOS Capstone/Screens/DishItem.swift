//
//  DishItem.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 06/04/23.
//

import SwiftUI

struct DishItem: View {
    
    @ObservedObject var dish: Dish
    
    var body: some View {
        HStack{
            VStack{
                Text("\(dish.title ?? "")").font(.sectionCategories())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                    .padding(.bottom,4)
                Text("\(dish.intro ?? "")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                    .padding(.bottom,2)
                Text("$\(dish.price ?? "0")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
                    
            }
            Spacer()
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
    }
}

struct DishItem_Previews: PreviewProvider {
    static var previews: some View {
        DishItem(dish: PersistenceController.oneDish())
    }
}
