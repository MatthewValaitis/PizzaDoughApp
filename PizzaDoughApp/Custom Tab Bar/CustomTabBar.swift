//
//  CustomTabBar.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 11/10/2022.
//

import SwiftUI

enum Tabs: Int {
    case planner = 0
    case schedule = 1
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack(alignment: .center) {
                
                Button {
                    selectedTab = .planner
                    
                } label: {
                    
                    TabBarButton(buttonText: "Planner",
                                 imageName: "arrowtriangle.down",
                                 isActive: selectedTab == .planner)
                    
                }

            
            Button {
                selectedTab = .schedule
                
            } label: {
                
                TabBarButton(buttonText: "Schedule",
                             imageName: "calendar",
                             isActive: selectedTab == .schedule)
            }
        
        }
        .frame(maxHeight: 82)
        .tint(Color(red: 95/255, green: 116/255, blue: 112/255))
        
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.planner))
    }
}
