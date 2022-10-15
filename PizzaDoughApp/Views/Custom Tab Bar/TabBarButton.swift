//
//  TabBarButton.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 11/10/2022.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    var selectedNameSpace: Namespace.ID
    
    var body: some View {
        
        GeometryReader { geo in
            
            if isActive {
                Rectangle()
                    .foregroundColor(Color(red: 95/255, green: 116/255, blue: 112/255))
                    .frame(width: geo.size.width/2, height: 4)
                    .padding(.leading, geo.size.width/4)
                    .matchedGeometryEffect(id: 1, in: selectedNameSpace)
            }
            
            
            
            VStack(alignment: .center, spacing: 4) {
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(buttonText)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

//struct TabBarButton_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        TabBarButton(buttonText: "Planner", imageName: "arrowtriangle.down", isActive: false, selectedNameSpace: )
//    }
//}
