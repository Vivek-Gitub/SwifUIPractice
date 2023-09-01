//
//  ContentView.swift
//  FitnessHealthKit
//
//  Created by Vivek Patel on 26/08/23.
//

import SwiftUI


let items: [Int] = Array(1...20) // Example data

struct ContentView: View {
    @EnvironmentObject var manager: HealthManager
    
    
    
    var body: some View {
        
        
        VStack(spacing: 20) {
            VStack(alignment: .trailing) {
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.accentColor)
                    .padding()
                
                
                Text("Hello, world!")
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 200, alignment: .top).background(Color.yellow)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum:
                                        100)),
                    GridItem(.flexible(minimum: 100, maximum: 100)),
                    GridItem(.flexible(minimum: 100, maximum: 100))], spacing: 16) {
                        ForEach(items, id: \.self) { item in
                            VStack {
                                Text("\(item)")
                                Text("\(item)").bold()
                                
                            }.frame(width: 100, height: 100).background(Color.blue).cornerRadius(10)
                            
                            
                        }
                    }.padding()
            }.background(Color.gray)
            
            
            
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)) // padding this padding give gap betwen whole area
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
