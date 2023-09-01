//
//  FitnessSwiftUIViewController.swift
//  ShiftUIPractice
//
//  Created by Vivek Patel on 31/08/23.
//

import SwiftUI

struct FitnessSwiftUITabView: View {
    
    

    
    
    @State var selectedTab = "Discover"
    
    var body: some View {
        
        // Tab bar
        TabView(selection: $selectedTab) {
            
            // Home Tab item
            LogInPageViewController()
                .tag("Home")
                .tabItem {
                    Image(selectedTab == "Home" ? "icons8-home-50" : "icons8-home-50 (1)")
                    
                }
            
            
            DiscoverSwiftUIView()
                .tag("Discover")
                .tabItem {
                    Image(selectedTab == "Discover" ? "icons8-discover-60" : "icons8-discover-48")
                }.onAppear(perform: {
                    print("hello world")
                })
            
            DeliveryLoginView()
                .tag("Chart")
                .tabItem {
                    Image(selectedTab == "Chart" ? "icons8-graph-50" : "icons8-graph-50")
            }
            Text("Hello world ")
                .tag("Setting")
                .tabItem {
                    Image(selectedTab == "Setting" ? "icons8-setting-50" : "icons8-settings-50")
            }
            
            
        }
    }
}

struct FitnessSwiftUIViewController_Previews: PreviewProvider {
    static var previews: some View {
        FitnessSwiftUITabView()
    }
}
