//
//  HeaderView.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 25/08/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                .rotationEffect(Angle(degrees: 15))
                
            
            VStack {
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text("Get Things Done")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 70)
            
        }.frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
