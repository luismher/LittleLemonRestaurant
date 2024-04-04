//
//  Menu.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//
import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText = ""
    
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    @State var loaded = false
    
    

    

    var body: some View {
        
        
        NavigationView {
            VStack{
            Header()
                    .frame(maxWidth: .infinity)
                    .padding(-10)
                    .padding(.horizontal, 50)
                VStack {
                Hero()
                
                    TextField("Search", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }.background(Color.primaryColor1)
                VStack {
                    Text("ORDER FOR DELIVERY!")
                        .font(.sectionTitle())
                        .foregroundColor(Color.primaryColor1)
                        .padding(.top)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView (.horizontal, showsIndicators: true){
                        HStack (spacing: 25){
                            Toggle("Starters", isOn: $startersIsEnabled)
                            Toggle("Mains", isOn: $mainsIsEnabled)
                            Toggle("Desserts", isOn: $dessertsIsEnabled)
                            Toggle("Drinks", isOn: $drinksIsEnabled)
                            
                        }
                        .padding()
                        .toggleStyle(ToggleCategoty())
                    }
                }.frame(maxWidth: .infinity, maxHeight: 50)
                    .padding()
                Divider()
                FetchedObjects(predicate: buildFilterPredicate(), sortDescriptors: buildSortDescriptor()) {
                    (dishes: [Dish]) in
                    List (dishes) { dish in
                            NavigationLink(destination: DetailItem(dish: dish)) {
                                DishItem(dish: dish)
                        }
                    }.listStyle(.plain)
                }
            }
        }.onAppear {
            if !loaded {
                MenuList.getMenuData(viewContext: viewContext)
                loaded = true
            }
        }
    }
    func buildSortDescriptor() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                  ascending: true,
                                  selector:
                                    #selector(NSString.localizedStandardCompare))]
    }
    
    func buildFilterPredicate () -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@ ", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@ ", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@ ", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@ ", "drinks") : NSPredicate(value: true)
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
    }
}
#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
