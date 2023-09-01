//
//  headerCardView.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 31/08/23.
//

import SwiftUI

struct HeaderCard {
    let id: Int
    let headingTitle:String
    let descriptionTitle:String
    let starRating:String
}


struct headerCardView: View {
    
    @State var headerCard:HeaderCard
    
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color(uiColor: .systemPink)
                .cornerRadius(15)
            
            VStack (alignment: .leading)  {
                Text(headerCard.headingTitle)
                    .font(.custom("Helvetica", size: 28))
                    .foregroundColor(.white)
                
                Text(headerCard.descriptionTitle)
                    .foregroundColor(.white)
                    .padding(.top,5)
                
                Spacer() // important
                
                HStack {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text(headerCard.starRating)
                        .foregroundColor(.white)
                    
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
            }
                .padding()
            
        }
        
    }
}

struct headerCardView_Previews: PreviewProvider {
    static var previews: some View {
        headerCardView(headerCard: HeaderCard(id: 0, headingTitle: "Home Workout", descriptionTitle: "12 Exercise", starRating: "4.9"))
    }
}
