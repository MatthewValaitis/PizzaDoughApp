//
//  StartButtonView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 10/10/2022.
//

import SwiftUI


struct StartButtonView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var doughs: FetchedResults<Dough>
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(doughs) { dough in
                    getDoughCell(for: dough)
                    
                }
            }
            .navigationTitle("Scheduled")
            .background(Color(red: 210/255, green: 212/255, blue: 200/255))
        }
    }
    
    
    
    func getDoughCell(for dough: Dough) -> some View {
        HStack {
            
            Image(dough.imageName ?? "Neapolitan")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
        
            Text(dough.name ?? "Dough")
                .font(.headline)

            Spacer()
            Divider()
            Spacer()
            
            VStack {
                
                Text("\(String(dough.provingDuration)) hrs")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color(red: 95/255, green: 116/255, blue: 112/255))
                
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(red: 224/255, green: 216/255, blue: 219/255))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: .infinity, maxHeight: 200)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 136/255, green: 150/255, blue: 150/255), lineWidth: 4))
        .shadow(radius: 5, x: 1, y: 1)
        .padding(.horizontal)
    }
    
    }


struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
    }
}
