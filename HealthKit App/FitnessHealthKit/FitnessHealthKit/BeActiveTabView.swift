//
//  BeActiveTabView.swift
//  FitnessHealthKit
//
//  Created by Vivek Patel on 26/08/23.
//

import SwiftUI

struct BeActiveTabView: View {
    
    @EnvironmentObject var manager: HealthManager
    
    @State var selectedTab = "Home"
    
    var body: some View {
        
        // MARK :- Here In we add an Tab bar controller
        TabView(selection: $selectedTab) {
            
            //Here first Hom Tab is Created
            HomeView()
                .tag("Home")
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home Tab")
                    }
                }
                .environmentObject(manager)
            // here we add a tab item in tab bar which is chartView
            ChartsView()
                .tag("Chart")
                .tabItem {
                    
                    VStack{
                        Image(systemName: "chart.xyaxis.line")
                        Text("Chart Tab")
                    }
                }
                .environmentObject(manager)
            
            
            //Here first person Tab is Created
            ContentView()
                .tag("person")
                .tabItem {
                    
                    VStack{
                        Image(systemName: "person")
                        Text("Person Tab")
                    }
                    
                    
                }
            
        }
    }
}

struct BeActiveTabView_Previews: PreviewProvider {
    static var previews: some View {
        let manager = HealthManager()
        BeActiveTabView()
            .environmentObject(manager)
    }
}
