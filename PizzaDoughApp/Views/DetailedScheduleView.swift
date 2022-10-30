//
//  DetailedScheduleView.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 13/10/2022.
//

import SwiftUI

struct DetailedScheduleView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var doughs: FetchedResults<Dough>
    
    var body: some View {
        ScrollView {
//            ForEach(doughs) { dough in
//                getDoughCell(for: dough)
            }
        }
    }
    
//    func getDoughCell(for dough: Dough) -> some View {
////        VStack {
////            Image(dough.imageName ?? "Neapolitan")
////                .resizable()
////                .scaledToFill()
////                .clipShape(Circle())
////                .frame(width: 60, height: 60)
////
////            Text(dough.name ?? "Dough")
////                .font(.headline)
////
////            Spacer()
////
////            Divider()
////
////            VStack {
////                Text("\(String(dough.provingDuration)) hrs")
////                    .font(.system(size: 15, weight: .bold))
////                    .foregroundColor(Color(red: 95/255, green: 116/255, blue: 112/255))
////                Text("\(String(dough.formDoughBallsMinutes)) mins")
////                    .font(.system(size: 15, weight: .bold))
////                    .foregroundColor(Color(red: 95/255, green: 116/255, blue: 112/255))
////
////            }
////            .padding(.horizontal)
////            .frame(width: 100)
////
////        }
////        .padding()
////        .background(Color(red: 224/255, green: 216/255, blue: 219/255))
////        .clipShape(RoundedRectangle(cornerRadius: 10))
////        .frame(maxHeight: 200)
////        .background(
////            RoundedRectangle(cornerRadius: 10)
////        )
////        .shadow(radius: 2, x: 0, y: 1)
////        .padding(.horizontal)
//    }
//}

struct DetailedScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedScheduleView()
    }
}
