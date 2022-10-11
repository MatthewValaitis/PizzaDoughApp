//
//  customDoughView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 06/10/2022.
//

import CoreData
import SwiftUI

struct CustomDoughView: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) private var moc
    
    @State private var userDough = ""
    @State private var userProvingDuration = ""
    @State private var userDescription = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            doughForm
        }
    }
    var doughForm: some View {
        Form {
            Section {
                HStack {
                    Text("Dough name")
                        .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    TextField("name", text: $userDough)
                        .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Text("Proving duration")
                        .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    TextField("duration", text: $userProvingDuration)
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Text("Your description")
                        .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    TextField("description", text: $userDescription)
                        .frame(maxWidth: .infinity)
                }
                
                if userDough.isEmpty == false && userProvingDuration.isEmpty == false {
                    
                    Button("Add") {
                        let customDough = Dough(context: moc)
                        customDough.id = UUID()
                        customDough.name = userDough
                        customDough.provingDuration = Double(userProvingDuration) ?? 0.0
                        customDough.additionalInfo = userDescription
                        
                        if moc.hasChanges {
                            try? moc.save()
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }
                
            }
        }
    }
}

struct CustomDoughView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDoughView()
    }
}
