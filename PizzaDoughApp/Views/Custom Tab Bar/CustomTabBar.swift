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
    @Namespace var selected
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                selectedTab = .planner
            } label: {
                TabBarButton(buttonText: "Planner",
                             imageName: "arrowtriangle.down",
                             isActive: selectedTab == .planner,
                             selectedNameSpace: selected)
            }
            
            Button {
                selectedTab = .schedule
            } label: {
                TabBarButton(buttonText: "Schedule",
                             imageName: "calendar",
                             isActive: selectedTab == .schedule,
                             selectedNameSpace: selected)
            }   
        }
        .frame(maxHeight: 68)
        .tint(Color(.black))
    }
    
    func select(_ tab: Tabs) {
        withAnimation(.easeIn) {
            selectedTab = tab
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.planner))
    }
}
