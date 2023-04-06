//
//  Menu.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 05/04/23.
//

import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    
    
    static func getMenuData(_ coreDataContext:NSManagedObjectContext) {
        PersistenceController.shared.clear("Dish")
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let urlRequest = URLRequest(url: url)
        let urlSession = URLSession.shared
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                    
                    Dish.createDishesFrom(menuItems:fullMenu.menu, coreDataContext)
                    try? coreDataContext.save();
                } else {
                    print(error.debugDescription.description)
                }
            } else {
                print(error.debugDescription.description)
            }
        }
        
        dataTask.resume()
        

    }
}

