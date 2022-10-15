//
//  TimelineView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 13/10/2022.
//

import SwiftUI

// TODO: Display end time for each step rather than duration

struct TimelineView: View {
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
    
    var body: some View {
        VStack {
            
            Image("timelineTitle")
                .padding(.bottom)
            
            ScrollView {
                GeometryReader { proxy in
                    VStack(alignment: .center) {
                        
                        
                        startTimeView
                        
                        intervalDividerView
                        
                        getTimeIntervalView(title: "Mix Ingredients", minutes: dough.mixIngredientsMinutes)
                        
                        intervalDividerView
                        
                        getTimeIntervalView(title: "Proving Time", minutes: dough.provingDuration * 60)
                        
                        intervalDividerView
                        
                        getTimeIntervalView(title: "Form Dough Balls", minutes: dough.formDoughBallsMinutes)
                    }
                    .frame(width: proxy.size.width)
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
        HStack {
            Text("Your Start Time:")
                .font(.system(size: 20, weight: .heavy))
            
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
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 224/255, green: 216/255, blue: 219/255))
        }
    }
    
    func getTimeIntervalView(title: String, minutes: Double) -> some View {
        VStack {
            Text(title)
                .font(.system(size: 20, weight: .bold))
            
            Text("Duration: \(minutes.minutesToTimeString)")
        }
        .padding()
        .frame(minHeight: 60)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 228/255, green: 228/255, blue: 228/255))
                .shadow(radius: 2, x: 0, y: 3)
        )
    }
}
