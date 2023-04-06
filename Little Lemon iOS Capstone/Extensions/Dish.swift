//
//  Dish.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 05/04/23.
//

import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            //guard let _ = exists(name: menuItem.name, context) else { continue }
            let dish = Dish(context: context)
            dish.intro = menuItem.description
            dish.title = menuItem.title
            dish.image = menuItem.image
            dish.price = menuItem.price
            dish.category = menuItem.category
            
        }
      
       

    }
    
}
