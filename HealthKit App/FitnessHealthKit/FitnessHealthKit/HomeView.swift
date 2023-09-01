//
//  HomeView.swift
//  FitnessHealthKit
//
//  Created by Vivek Patel on 26/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var manager: HealthManager
    let welcomeArray = ["welcome", "Bienvendio", "Bienvenue"]
    @State private var currentIndex = 0
    
    var body: some View {
        
        
        ScrollView {
            
        VStack(alignment: .leading) {
            Text(welcomeArray[currentIndex])
                .font(.largeTitle)
                .padding()
                .foregroundColor(.secondary)
                .animation(.easeInOut(duration: 1), value: currentIndex)
                .onAppear {
                    startWelcomeTimer()
                }
            
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                
                ForEach(manager.markActivities.sorted(by: { $0.value.id < $1.value.id}), id: \.key) { item in
                    ActivityCard(activity: item.value)
                }
                
            }.padding(.horizontal)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
        
        
    }
    
    func startWelcomeTimer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % welcomeArray.count
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let manager = HealthManager()
        HomeView()
            .environmentObject(manager)
    }
}
