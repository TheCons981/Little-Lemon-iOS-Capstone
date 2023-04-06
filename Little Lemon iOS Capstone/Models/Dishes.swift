//
//  Dishes.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 05/04/23.
//


import Foundation
import CoreData

@MainActor
class DishesModel: ObservableObject {
    
    @Published var menuItems = [MenuItem]()
    
    
}

