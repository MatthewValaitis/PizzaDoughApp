//
//  ScheduleView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 10/10/2022.
//

import SwiftUI


struct PlannerView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var doughs: FetchedResults<Dough>
    
    @ObservedObject private var viewModel = PlannerViewModel()
    @State private var readyForTime = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image("pizzaPlannerTitle")
                    .padding(.vertical, 4 )
                
                Text("Set up your time to eat.")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
                    .fontWeight(.bold)

                
                HStack {
                    
                    Spacer(minLength: 20)
                    
                    Image(systemName: "arrow.right")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 50, height: 40)
                    
                    readyTimeInputView
                    
                    

 
                }
                
                
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray)
                    .padding(.vertical)
                
                HStack {
                    
                    Text("Select a dough")
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                        .padding(.leading)
                    
                    Spacer()
                    
                    NavigationLink {
                        CustomDoughView()
                        
                    } label: {
                        HStack(alignment: .center) {
                            Text("Add your own recipe")
                                .font(.system(size: 14, design: .monospaced))
                                .foregroundColor(.red)
                            Image(systemName: "plus.circle.fill")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.gray)
                                
                            
                        }
                        .padding(.trailing, 14)
                        
                    }
                    
                }
                .padding(.top, 25)
                
                ScrollView {
                    ForEach(doughs) { dough in
                        NavigationLink(destination: ResultsView(startDate: viewModel.startTime(date: readyForTime, dough: dough), dough: dough)) {
                            getDoughCell(for: dough)
                        }
                    }
                }
            }
        }
    }
    
    var readyTimeInputView: some View {
        HStack(alignment: .center) {
                        

            
            DatePicker("", selection: $readyForTime, in: Date()...)
                .datePickerStyle(.automatic)
                .frame(width: 230)
            
            Spacer()
        }
        

    }
    
    func getStepCell(for step: Step) -> some View {
        HStack {
            Image("Neapolitan")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
            
            Spacer()
            
            Text(step.wrappedname)
                .font(.headline)
                .foregroundColor(.red)
            
            Spacer()
            
            Divider()
                        
            VStack {
                Text(String(step.duration))
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.gray)
                
            }
            .padding(.horizontal)
            
            Image(systemName: "chevron.forward")
                .foregroundColor(.gray)
                .padding(.trailing)
            
        }
        .padding()
        .frame(maxHeight: 200)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 228/255, green: 228/255, blue: 228/255))
                .shadow(radius: 2, x: 0, y: 3)
        )
        .padding(.horizontal)
    }
    
    func getDoughCell(for dough: Dough) -> some View {
        HStack {
            Image(dough.imageName ?? "Neapolitan")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
            
            Spacer()
            
            Text(dough.name ?? "Dough")
                .font(.headline)
                .foregroundColor(.red)
            
            Spacer()
            
            Divider()
                        
            VStack {
                Text(dough.totalMinutes.minutesToTimeString)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.gray)
                
            }
            .padding(.horizontal)
            
            Image(systemName: "chevron.forward")
                .foregroundColor(.gray)
                .padding(.trailing)
            
        }
        .padding()
        .frame(maxHeight: 200)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 228/255, green: 228/255, blue: 228/255))
                .shadow(radius: 2, x: 0, y: 3)
        )
        .padding(.horizontal)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}
