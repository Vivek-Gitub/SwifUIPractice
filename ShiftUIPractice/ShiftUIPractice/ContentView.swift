//
//  ContentView.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 25/08/23.
//

import SwiftUI
    
struct ContentView: View {
    
    @State private var name: String = String()
        
    var body: some View {
        
        
        ScrollView(.vertical) {
            
        VStack {
            
            VStack {
                Image(systemName: "globe").imageScale(.large).foregroundColor(.accentColor)
                Text("Hello, world!").font(.title).foregroundColor(.green)
                
                TextField("Username", text: $name)
                Button(action: {
                    debugPrint("helo \(self.name)")
                }, label: {
                    Text("Login")
                }).disabled(name.count < 4).foregroundColor(.black).border(.green)
            }
            .padding().border(.orange)
            
            VStack {
                Image(systemName: "globe").imageScale(.large).foregroundColor(.accentColor)
                Text("Hello, world!").font(.title).foregroundColor(.green)
                
                TextField("Username", text: $name)
                Button(action: {
                    debugPrint("helo \(self.name)")
                }, label: {
                    Text("Login")
                }).disabled(name.count < 4).foregroundColor(.black).border(.green)
            }
            .padding().border(.orange)
            
            VStack {
                Image(systemName: "globe").imageScale(.large).foregroundColor(.accentColor)
                Text("Hello, world!").font(.title).foregroundColor(.green)
                
                TextField("Username", text: $name)
                Button(action: {
                    debugPrint("helo \(self.name)")
                }, label: {
                    Text("Login")
                }).disabled(name.count < 4).foregroundColor(.black).border(.green)
            }
            .padding().border(.orange)
            
            VStack {
                Image(systemName: "globe").imageScale(.large).foregroundColor(.accentColor)
                Text("Hello, world!").font(.title).foregroundColor(.green)
                
                TextField("Username", text: $name)
                Button(action: {
                    debugPrint("helo \(self.name)")
                }, label: {
                    Text("Login")
                }).disabled(name.count < 4).foregroundColor(.black).border(.green)
            }
            .padding().border(.orange)
            
            VStack {
                Image(systemName: "globe").imageScale(.large).foregroundColor(.accentColor)
                Text("Hello, world!").font(.title).foregroundColor(.green)
                
                TextField("Username", text: $name)
                Button(action: {
                    debugPrint("helo \(self.name)")
                }, label: {
                    Text("Login")
                }).disabled(name.count < 4).foregroundColor(.black).border(.green)
            }
            .padding().border(.orange)
            
        }
    }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
