//
//  FooterCardView.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 01/09/23.
//

import SwiftUI


struct FooterCard {
    let id:Int
    let title:String
    let numberOfExercise: Int
}


struct FooterCardView: View {
    
    @State var footerCard: FooterCard
    
    var body: some View {
        
        
        
        ZStack(alignment: .leading) {
        Color("footerCustomColor")
            .cornerRadius(15)
        
            VStack(alignment: .leading) {
                Text(footerCard.title)
                    .font(.custom("Helvetica", size: 18))
                    .frame(width: 180,height: 45,alignment: .topLeading)
                    .padding(.bottom,10)
                
            Spacer()
                
            HStack {
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.white.opacity(0.5))
                        .frame(width: 40,height: 40)
                        .cornerRadius(8)
                    
                    Image("weightLifting").foregroundColor(.brown)
                    
                    
                }
                Text("\(footerCard.numberOfExercise) Exercise")
            }
            
                
            }
            
            .padding(15)
        }
    }
}

struct FooterCardView_Previews: PreviewProvider {
    static var previews: some View {
        FooterCardView(footerCard: FooterCard(id: 0, title: "Chest & abdominal exercises", numberOfExercise: 12))
    }
}
