//
//  Menu.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 04/04/23.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var viewModel: GenericViewModel
    
    @State var isLoaded = false
    @State var searchText = ""
    
    @ObservedObject var menuCategory: MenuCategoryState = MenuCategoryState([
        MenuCategory(categoryName: "Starter", selected: true, key: "starters"),
        MenuCategory(categoryName: "Main", selected: true, key: "mains"),
        MenuCategory(categoryName: "Dessert", selected: true, key: "desserts"),
        MenuCategory(categoryName: "Drink", selected: true, key: "drinks")
    ])
    
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Header().frame(maxHeight: 70)
                Hero(searchText: $searchText).environmentObject(viewModel).frame(maxHeight: 200)
                MenuBreakDown(menuCategory: menuCategory)
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List(dishes){
                        dish in
                        NavigationLink(destination: DetailItem(dish: dish)){
                            DishItem(dish: dish)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            
        }
        .task(){
            if !isLoaded{
                MenuList.getMenuData(viewContext)
                isLoaded = true
            }
            
        }
    }
    
    
    
    func getAppName() -> String {
        var appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
        if appName.isEmpty {
            appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
        }
            
        return appName
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                  ascending: true,
                                  selector:
                                    #selector(NSString.localizedStandardCompare))]
    }

    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        
        var predicates = [NSPredicate]()
        predicates.append(search)
        for category in menuCategory.categories{
            let predicate = !category.selected ? NSPredicate(format: "category != %@", category.key) : NSPredicate(value: true)
            predicates.append(predicate)
            
        }
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        print(predicates)
        return compoundPredicate
    }
}



struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext).environmentObject(GenericViewModel())
    }
}
