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
    @State private var userDoughBallTime = 1
    @State private var userMixingIngredients = 1
    
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
                    Text("Dough name *")
                        .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    TextField("name", text: $userDough)
                        .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Text("Your description")
                        .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    TextField("description", text: $userDescription)
                        .frame(maxWidth: .infinity)
                }
                
                
                
                HStack {
                    
                    Picker("Combining ingredients", selection: $userMixingIngredients) {
                        ForEach(1..<61) { i in
                            Text("\(i)").tag(i)
                        }
                    }
                    Text("minutes")
                }
                
                
                HStack {
                    Text("Proving duration *")
                        .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    TextField("hours", text: $userProvingDuration)
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: .infinity)
                }

                
                
                HStack {
                    
                    Picker("Dividing doughballs", selection: $userDoughBallTime) {
                        ForEach(1..<61) { i in
                            Text("\(i)").tag(i)
                        }
                    }
                    Text("minutes")
                }
                
                

                if userDough.isEmpty == false && userProvingDuration.isEmpty == false {
                    
                    Button("Add") {
                        let customDough = Dough(context: moc)
                        customDough.id = UUID()
                        customDough.name = userDough
                        customDough.provingDuration = Double(userProvingDuration) ?? 0.0
                        customDough.additionalInfo = userDescription
                        customDough.mixIngredientsMinutes = Double(userMixingIngredients)
                        customDough.formDoughBallsMinutes = Double(userDoughBallTime)
                        
                        print("New Custom Dough:", customDough)
                        
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
