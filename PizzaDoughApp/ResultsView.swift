//
//  ResultsView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 04/10/2022.
//

import SwiftUI
import UserNotifications

struct ResultsView: View {
    
    var startDate: Date
    
    var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy HH:mm"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("\(formatter.string(from: startDate))")
                    .padding(.horizontal)
                    .font(.title)
//                    .padding()
//                    .background(.black.opacity(0.70))
//                    .foregroundColor(.white)
//                    .clipShape(Capsule())
                      
                
                Spacer()
                Spacer()
                
                Button("Schedule Notification") {
                    NotificationManager.instance.scheduleNotification(startDate)
                }
                Text("Let us remind you when to get started!")
                    .font(.caption)
                
                Spacer()
            }
            .onAppear {
                NotificationManager.instance.requestAuthorization()
            }
        }
        .navigationTitle("Your start time")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(startDate: Date())
    }
}
