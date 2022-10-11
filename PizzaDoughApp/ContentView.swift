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
    @FetchRequest(sortDescriptors: []) var doughs: FetchedResults<Dough>
    
    @ObservedObject var viewModel = ContentViewModel()
    @State var pizzaDay = Date()
    @State var selectedDoughName: String = ""
    @State var doughNames: [String] = []
    @State var doughTimes: [Double] = []
    @State private var addDoughViewPresented = false
    private var selectedDough: Dough? {
        doughs.first { $0.name == selectedDoughName }
    }
    
//    private var provingTimeString: String { "\(selectedDough.provingDuration, specifier: "%.2f")" }
    
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("Pizza day!", selection: $pizzaDay, in: Date()...)
                    .datePickerStyle(.automatic)
                
                Picker("The dough", selection: $selectedDoughName) {
                    ForEach(doughNames, id: \.self) { name in
                        Text(name)
                        
                    }
                }
                
                if let selectedDough = selectedDough {
                    Text("Prep time is \(selectedDough.provingDuration, specifier: "%.2f") hours")
                    
                }
                
            
                
                Section {
                    
                    if let selectedDough = selectedDough {
                        NavigationLink {
                            ResultsView(startDate: viewModel.startTime(date: pizzaDay, dough: selectedDough))
                            
                        } label: {
                            Text("When do we start!")
                        }
                        
                    }
                    
                    Button("Add your own recipe") {
                        addDoughViewPresented = true
                    }
                }
            }
            .onAppear {
                setDoughNames()
            }
            .navigationTitle("Pizza Planner").frame(alignment: .center)
            .sheet(isPresented: $addDoughViewPresented) {
                CustomDoughView()
            }
            .onChange(of: addDoughViewPresented) { _ in
                setDoughNames()
            }
        }
    }
    
    func setDoughNames() {
        doughNames = doughs.map {
            $0.name ?? "Unknown Name"
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
