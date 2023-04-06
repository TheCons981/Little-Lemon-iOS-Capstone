//
//  MenuBreakDown.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 05/04/23.
//

import SwiftUI

struct MenuBreakDown: View {
    
    @ObservedObject var menuCategory: MenuCategoryState
    
    var body: some View {
        VStack{
            
            Text("ORDER FOR DELIVERY!")
                .font(.sectionTitle())
                .foregroundColor(.highlightColor2)
                .padding(.top)
                .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach($menuCategory.categories){
                        item in
                        Toggle(item.categoryName.wrappedValue, isOn: item.selected)
                    }
                }
                
                .toggleStyle(RoundButtonToggle())
                .padding(.horizontal)
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        
        
    }
    
    func getCategoryState(_ categoryName: String) -> Binding<Bool> {
        
        let index = menuCategory.categories.firstIndex{$0.categoryName == categoryName} ?? -1
        
        return Binding(
            get: { menuCategory.categories[index].selected },
            set: { menuCategory.categories[index].selected = $0 }
        )
        
        
    }
}

struct MenuBreakDown_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakDown(menuCategory: MenuCategoryState([
            MenuCategory(categoryName: "Starter", selected: true, key: "starters"),
            MenuCategory(categoryName: "Main", selected: true, key: "mains"),
            MenuCategory(categoryName: "Dessert", selected: true, key: "desserts"),
            MenuCategory(categoryName: "Drink", selected: true, key: "drinks")
        ]))
    }
}
