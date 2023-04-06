//
//  MenuCategory.swift
//  Little Lemon dinner menu
//
//  Created by Andrea Consorti on 29/03/23.
//

import Foundation

class MenuCategoryState: ObservableObject {
    @Published var categories: [MenuCategory] = []
        init(_ categories: [MenuCategory]) {
            self.categories = categories
        }
}

class MenuCategory: ObservableObject,Identifiable {
    var id: UUID = .init()
    var categoryName: String
    var key: String
    @Published var selected: Bool
    
    init(categoryName: String, selected: Bool, key: String) {
        self.categoryName = categoryName
        self.selected = selected
        self.key = key
    }
}
