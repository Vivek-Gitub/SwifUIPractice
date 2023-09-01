//
//  LoginHeaderView.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 28/08/23.
//

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("Group 93")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 301, height: 225, alignment: .center)
                .padding(EdgeInsets(top: 30, leading: 40, bottom: 50, trailing: 40))


            
            Text("Let’s Log in")
                .font(.system(size: 36, weight: .bold))
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            Text("Welcome Back, you’ve been missed!")
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 30))
            
        }
    }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView()
    }
}
