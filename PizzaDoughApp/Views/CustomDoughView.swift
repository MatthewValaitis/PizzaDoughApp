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
        ZStack {
            VStack {
                
                Image("customRecipe")
                    .padding(.vertical, 4  )
                
                Text("Create your steps.")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                
                customStepView
            }
            .onAppear {
                viewModel.createStep(moc: moc)
            }
            if userDough.isEmpty == false {
                VStack {
                    Spacer()
                    Button {
                        viewModel.saveDough(name: userDough, description: userDescription, moc: moc)
                    } label: {
                        Spacer()
                        HStack {
                            Image(systemName: "note.text.badge.plus")
                            Text("Add recipe")
                        }
                        .padding()
                        .background(
                            Capsule()
                                .fill(.white)
                                .shadow(radius: 2, x: 0, y: 3)
                        )
                    }
                    .padding()
                }
            }
            
        }
    }
    var customStepView: some View {
        VStack {
            ScrollView {
                VStack {

                    
                    customStepTextField(title: "Dough name *", fieldtext: "name", binding: $userDough)
                    
                    customStepTextField(title: "Your description", fieldtext: "description", binding: $userDescription)
                    
                }
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.white)
                        .shadow(radius: 2, x: 0, y: 3)
                )
                .padding()
                
                
                
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
                .padding(.horizontal, 30)
                
                ForEach(viewModel.steps) { step in
                    VStack {
                        Button {
                            viewModel.insertStep(at: step.index)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .padding(.vertical, 4)
                        }
                        
                        VStack {
                            
                            Text("Step \(step.index + 1)")
                                .font(.system(size: 20, weight: .bold))
                            
                            customStepTextField(title: "Description", fieldtext: "Your step", binding: viewModel.getStepNameBinding(for: Int(step.index)))
                            customStepTextField(title: "Duration", fieldtext: "minutes", binding: viewModel.getDurationBinding(for: Int(step.index)))
                            
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.white)
                                .shadow(radius: 2, x: 0, y: 3)
                        )
                        .padding(.horizontal)
                        
                        Button {
                            viewModel.insertStep(at: step.index + 1)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .padding(.vertical, 4)
                        }
                    }
                }
                Spacer(minLength: 50
                )

            }
        }
        .background(Color(red: 228/255, green: 228/255, blue: 228/255))
        
    }
    
    func customStepTextField(title: String, fieldtext: String, binding: Binding<String>) -> some View {
            HStack {
                Text(title)
                    .frame(maxWidth: .infinity)
                
                Divider()
                
                TextField(fieldtext, text: binding)
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxHeight: 200)
    }
}

struct CustomDoughView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDoughView()
    }
}
