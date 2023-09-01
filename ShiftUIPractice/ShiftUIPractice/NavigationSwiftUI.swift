//
//  NavigationSwiftUI.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 25/08/23.
//

import SwiftUI

struct NavigationSwiftUI: View {
    
    var body: some View {
        
        NavigationView {
            Screen(title: "Home", text: "First Screen", imageName: "house")
        }
    }
}

struct Screen: View {
    
    let title: String
    let text: String
    let imageName: String
    
    var body: some View {
        
        // HStack {}
            
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200,
                           height: 200,
                           alignment: .center)
                    .padding()
                
                Text(text)
                    .font(.system(size: 30, weight: .light,
                                  design: .default))
                    .padding()
                NavigationLink(
                    // Destination is mainly for where you want to move
                    destination: Screen(title: "Notification", text: "Second Screen", imageName: "bell"),
                    label: {
                        //                                            Text("Continue")
                        //                                                    .frame(width: 200, height: 50, alignment: .center).foregroundColor(.white).cornerRadius(8).background(Color.pink)
                        ContinueButton(color: .pink)
                    })
            }
            .navigationTitle(title)
            .background(Color(.systemGray5))
            
    }
}




struct ContinueButton: View {
    
    let color: Color
    var body: some View {
        Text("Continue")
            .frame(width: 200, height: 50, alignment: .center)
            .foregroundColor(.white)
            .cornerRadius(8)
            .background(color)
    }
}

struct NavigationSwiftUI_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationSwiftUI()
    }
    
}
