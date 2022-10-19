//
//  LocalNotifications.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 05/10/2022.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager() // Singleton
    
    private init() { }
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(_ date: Date) {
        let content =  UNMutableNotificationContent()
        content.title = "Time to make pizza"
        content.subtitle = "Roll up your sleeves!"
        content.sound = .default
        content.badge = 1
        
        let triggerDate = Calendar.current.dateComponents([.day, .month, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
}


struct LocalNotifications: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotifications()
    }
}
