//
//  ContentView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 04/10/2022.
//

import CoreData
import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var doughs: FetchedResults<UserDough>
    
    @ObservedObject var viewModel = ContentViewModel()
    @State var pizzaDay = Date()
    @State var doughSelection = Dough(type: "Gluten free", provingDuration: 5.0, description: "")
    
    @State var userDough: String
    @State var userProvingDuration: Double
    
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("Pizza day!", selection: $pizzaDay, in: Date()...)
                    .datePickerStyle(.automatic)
                Picker("The dough", selection: $doughSelection) {
                    ForEach(viewModel.doughTypes, id: \.self) { dough in
                        Text(dough.type)
                    }
                }
                
                Section {
                    TextField("your dough", text: $userDough)
                    Stepper("Proving duration \(userProvingDuration)", value: $userProvingDuration, in: 1...24)
                    
                }
                
                Section {
                    NavigationLink {
                        ResultsView(startDate: viewModel.startTime(date: pizzaDay, dough: doughSelection ))
                    } label: {
                        Text("When do we start!")
                    }
                }
            }
            .navigationTitle("Pizza Planner")
//                Form {
//                DatePicker("Pizza day!", selection: $viewModel.pizzaDay, in: Date()...)
//                    Picker("The dough", selection: $viewModel.doughSelection) {
//                        ForEach(viewModel.doughTypes, id: \.self) { dough in
//                            Text(dough.type)
//                        }
//                    }
//
//                    Section {
//                        NavigationLink {
//                            ResultsView(pizzaDough: ContentViewModel())
//                        } label: {
//                            Text("When do we start!")
//                        }
//                    }
//                }
//                .navigationTitle("Lets set a date")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userDough: "Nan's dough", userProvingDuration: 8)
    }
}
