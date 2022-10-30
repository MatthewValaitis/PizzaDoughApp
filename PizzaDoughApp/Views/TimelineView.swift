//
//  TimelineView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 13/10/2022.
//

import SwiftUI

// TODO: Display end time for each step rather than duration

struct TimelineView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var doughs: FetchedResults<Dough>
    
    
    private let viewModel: TimelineViewModel
    
    @State private var showingAlert = false
    @State private var readyTime = Date()
    
    let dough: Dough
    let startDate: Date
    private let minuteHeightConstant: CGFloat = 1
    
    var timeFormatter: DateFormatter = {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter
    }()
    
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy"
        return dateFormatter
    }()
    
    init(dough: Dough, startDate: Date) {
        self.dough = dough
        self.startDate = startDate
        viewModel = TimelineViewModel(dough: dough, startDate: startDate)
    }
    
    
    var body: some View {
        VStack {
            
            Image("timelineTitle")
                .padding(.bottom)
            
            Rectangle()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
                .padding(.top)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    
                    startTimeView
                    
                    VStack {
                        ForEach(dough.stepsArray, id: \.self) { step in
                            intervalDividerView
                            getTimeIntervalView(title: step.wrappedname, minutes: step.duration, startDate: viewModel.getStartDate(for: Int(step.index)))
                        }
                    }
                }
            }
        }
    }
    
    var intervalDividerView: some View {
        Rectangle()
            .fill(.gray)
            .frame(width: 4, height: 40)
    }
    
    var startTimeView: some View {
        VStack {
            HStack {
                Text("Your Start Time")
                    .font(.system(size: 16, weight: .heavy, design: .monospaced))
                    .foregroundColor(.red)
            }
            
            VStack {
                Text("\(timeFormatter.string(from: startDate))")
                    .padding(.horizontal)
                    .font(.system(size: 30, weight: .bold))
                
                Text("\(dateFormatter.string(from: startDate))")
                    .padding(.horizontal)
                    .font(.subheadline)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 228/255, green: 228/255, blue: 228/255))
                .shadow(radius: 2, x: 0, y: 3))

    }
    
    func getTimeIntervalView(title: String, minutes: Double, startDate: Date) -> some View {
        VStack {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .padding(.horizontal, 10)

            
            Text("Start:\(timeFormatter.string(from: startDate))")
                .foregroundColor(.red)
            
            Text("Duration: \(minutes.minutesToTimeString)")

        }
        .padding()
        .frame(maxWidth: 300)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 228/255, green: 228/255, blue: 228/255))
                .shadow(radius: 2, x: 0, y: 3)
        )
    }
}
