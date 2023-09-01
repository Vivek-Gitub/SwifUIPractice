//
//  FitnessHealthKitApp.swift
//  FitnessHealthKit
//
//  Created by Vivek Patel on 26/08/23.
//

import SwiftUI

@main
struct FitnessHealthKitApp: App {
    
    @StateObject var manager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            BeActiveTabView()
                .environmentObject(manager)
        }
    }
}
