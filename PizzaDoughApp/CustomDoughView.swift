//
//  customDoughView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 06/10/2022.
//

import CoreData
import SwiftUI

struct CustomDoughView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var doughs: FetchedResults<UserDough>
    
    @State var userDough: String
    @State var userProvingDuration: Double
    
    var body: some View {
        Form {
            Section {
                TextField("your dough", text: $userDough)
                Stepper("Proving duration \(userProvingDuration)", value: $userProvingDuration, in: 1...24)
                
                Button("Add") {
                    
                    let customDough = UserDough(context: moc)
                    customDough.id = UUID()
                    customDough.type = userDough
                    customDough.provingDuration = userProvingDuration
                }
                
            }
        }
    }
}

struct CustomDoughView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDoughView(userDough: "Nan's", userProvingDuration: 8 )
    }
}
