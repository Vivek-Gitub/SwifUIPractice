//
//  ActivityCard.swift
//  FitnessHealthKit
//
//  Created by Vivek Patel on 26/08/23.
//

import SwiftUI

struct Activity {
    let id:Int
    let title: String
    let subTitle:String
    let image: String
    let tintColor: Color
    let amount: String
    
}


struct ActivityCard: View {
    
    @State var activity: Activity
    
    var body: some View {
        
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            VStack(spacing: 20) {
                HStack (alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.title)
                            .font(.system(size: 16))
                        
                        Text(activity.subTitle)
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                    }
    //               Spacer(minLength: 45)
                    Spacer() // it give space between the upper conetent and lower content
                    Image(systemName: activity.image)
                        .foregroundColor(activity.tintColor)
                }.padding()
                Text(activity.amount)
                    .font(.system(size: 24))
                    .minimumScaleFactor(0.6)
                    .bold()
                    .padding(.bottom)
            }
        }
        
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard(activity: Activity(id: 0, title: "Daily Steops", subTitle: "Goal", image: "figure.walk", tintColor: .green, amount: "6,854"))
    }
}
