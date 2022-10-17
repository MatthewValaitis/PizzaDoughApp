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
    var dough: Dough
    
    var body: some View {
        NavigationView {
            VStack {
            
                
                TimelineView(dough: dough, startDate: startDate)
                
                Spacer()
                
                setNotificationButton
                    .padding()
                    .padding(.bottom, 10)
            }
            .onAppear {
                NotificationManager.instance.requestAuthorization()
            }
        }
    }
    
    var setNotificationButton: some View {
        HStack {
            Spacer()
            
            Button(action: {
                NotificationManager.instance.scheduleNotification(startDate)
                showingAlert = true
            }, label: {
                Text("Schedule Start Notification")
                    .font(.subheadline)
            })
            .alert("Notification scheduled!", isPresented: $showingAlert) {
                Button("OK") { }
            }
            .padding(6)
            .background(.black.opacity(0.70))
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultsView(startDate: Date(), dough: Dough())
        }
    }
}
