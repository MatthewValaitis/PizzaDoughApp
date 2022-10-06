//
//  UserDoughView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 05/10/2022.
//

import CoreData
import SwiftUI

class DataController: ObservableObject {
  let container = NSPersistentContainer(name: "Dough")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

struct UserDoughView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UserDoughView_Previews: PreviewProvider {
    static var previews: some View {
        UserDoughView()
    }
}
