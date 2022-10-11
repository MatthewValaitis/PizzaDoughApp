//
//  ResultsView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 04/10/2022.
//

import SwiftUI
import UserNotifications

struct ResultsView: View {
    
    @State private var showingAlert = false
    
    var startDate: Date
    
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
        NavigationView {
            VStack {
                Spacer()
                
                Text("\(timeFormatter.string(from: startDate))")
                    .padding(.horizontal)
                    .font(.system(size: 40, weight: .bold))
                
                Text("\(dateFormatter.string(from: startDate))")
                    .padding(.horizontal)
                    .font(.subheadline)
                      
                Spacer()
                
                Spacer()
                
                VStack {
                    Button(action: {
                        NotificationManager.instance.scheduleNotification(startDate)
                        showingAlert = true
                    }, label: {
                        VStack {
                            Text("Schedule Notification")
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("Reminder when to start!")
                                .font(.subheadline)
                                
                        }
                    })
                    .alert("Notification scheduled!", isPresented: $showingAlert) {
                          Button("OK") { }
                    }
                }
                .padding()
                .background(.black.opacity(0.70))
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                Spacer()
            }
            .onAppear {
                NotificationManager.instance.requestAuthorization()
            }
        }
        .navigationTitle("Your start time ")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultsView(startDate: Date())
        }
    }
}
