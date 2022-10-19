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
    
    @ObservedObject private var viewModel = CustomDoughViewModel()
    
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
        .onAppear {
            viewModel.createStep(moc: moc)
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

            }
            Section {
                Stepper(label: {
                    Text("Add a step (\(viewModel.steps.count))")
                }, onIncrement: {
                    viewModel.createStep(moc: moc)
                    
                }, onDecrement: {
                    if viewModel.steps.count >= 1 {
                        viewModel.deleteStep()
                    } 
                })
                
            }
            
            ForEach(viewModel.steps) { step in
                Section {
                    Button {
                        viewModel.insertStep(at: step.index)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    
                    Text("Step \(step.index + 1)")
                    TextField("name", text: viewModel.getStepNameBinding(for: Int(step.index)))
                    TextField("duration minutes", text: viewModel.getDurationBinding(for: Int(step.index)))
                        .keyboardType(.numberPad)
                    Button {
                        viewModel.insertStep(at: step.index + 1)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            
            
            if userDough.isEmpty == false {
                
                Button("Add") {
                    viewModel.saveDough(name: userDough, description: userDescription, moc: moc)
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
