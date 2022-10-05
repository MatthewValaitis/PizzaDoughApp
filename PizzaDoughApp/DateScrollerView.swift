//
//  DateScrollerView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 04/10/2022.
//

import SwiftUI


struct DateScrollerView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        
        HStack {
            Spacer()
            Button(action: previousMonth) {
                
            }
            Spacer()
            
        }
    }
    
    func previousMonth() {
        
    }
    
    func nextMonth() {
        
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
    }
}
