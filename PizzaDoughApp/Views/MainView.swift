//
//  MainView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 10/10/2022.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTab: Tabs = .planner
    
    var body: some View {
        switch selectedTab {
        case .planner:
            PlannerView()
        case .schedule:
            Text("To be confirmed")
//            DetailedScheduleView()
        }
            
        Spacer()
        CustomTabBar(selectedTab: $selectedTab)
        }
    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
