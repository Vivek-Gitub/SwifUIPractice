//
//  HealthManager.swift
//  FitnessHealthKit
//
//  Created by Vivek Patel on 26/08/23.
//

import Foundation
import HealthKit


class HealthManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    
    @Published var activities: [String : Activity] = [:]
    
    @Published var oneMonthCharData = [DailyStepView]()
    
    @Published var markActivities: [String: Activity] = [
        "todaySteps" : Activity(id: 0, title: "Today Steps", subTitle: "Goal 10,000", image: "figure.walk", tintColor: .green, amount: "12,232"),
        "todayCalories" : Activity(id: 1, title: "Today Calories", subTitle: "Goal 900", image: "flame", tintColor: .red, amount: "1,678"),
        "weekRunning" : Activity(id: 2, title: "Running", subTitle: "Mins this week", image: "figure.walk", tintColor: .green, amount: "60 minutes"),
        "WeekLifting" : Activity(id: 3, title: "Weight Lightings", subTitle: "This week", image: "dumbbell", tintColor: .cyan, amount: "80 minutes"),
        "weekSoccer" : Activity(id: 4, title: "Scooer", subTitle: "This week", image: "figure.soccer", tintColor: .blue, amount: "20 minutes"),
        "weekBasketball" : Activity(id: 5, title: "Basketball", subTitle: "This week", image: "figure.basketball", tintColor: .orange, amount: "18 minutes")
    ]
    
    // on starting wem want for user to authentication for access data
    init() {
        
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        
        let workout = HKQuantityType.workoutType()
        
        let healthTypes:Set = [steps, calories, workout]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                fetchTodayCalories()
                fetchtodaySteps()
                
//                fetchCrrentWeekRunningStats()
//                fetchCurrentWeekStrengthStats()
                fetchCurrentWeekWorkoutStats()
                fetchPastMonthStepdata()
                
            } catch {
                print("Error fetching the healrth data ")
            }
            
        }
        
    }
    
    func fetchDailySteps(startDate: Date, completion: @escaping ([DailyStepView]) -> Void) {
        let steps = HKQuantityType(.stepCount)
        let interval = DateComponents(day: 1)
        
        let anchorDate = Calendar.current.startOfDay(for: startDate)
        let query = HKStatisticsCollectionQuery(quantityType: steps, quantitySamplePredicate: nil, anchorDate: anchorDate, intervalComponents: interval)
        
        query.initialResultsHandler = { query, result, error in
            guard let result = result  else {
                completion([])
                return
            }
             var dailySteps = [DailyStepView]()
            result.enumerateStatistics(from: startDate, to: Date()) { statistics, stop in
                dailySteps.append(DailyStepView(date: statistics.startDate, stepCount: statistics.sumQuantity()?.doubleValue(for: .count()) ?? 0.00))
                
            }
            completion(dailySteps)
        }
        
        healthStore.execute(query)
    }
    
    
    func fetchtodaySteps() {
        let steps = HKQuantityType(.stepCount)
        
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate){
            _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else{
                print("error fetching today data")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            let activity = Activity(id: 0, title: "Today Steps", subTitle: "Goal 10,000", image: "figure.walk", tintColor: .green, amount: stepCount.formattedString())
            
            DispatchQueue.main.async {
                
                self.activities["todaySteps"] = activity
            }
            
            print(stepCount.formattedString())
            
        }
        healthStore.execute(query)
    }
    
    func fetchTodayCalories() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) {_,result,error in
            
            guard let quantity = result?.sumQuantity(), error == nil else{
                print("error fetching Calories data")
                return
            }
            
            let caloriesBurn = quantity.doubleValue(for: .kilocalorie())
            let activity = Activity(id: 1, title: "Today Calories", subTitle: "Goal 900", image: "flame", tintColor: .red, amount: caloriesBurn.formattedString())
            
            DispatchQueue.main.async {
                
                self.activities["todaycalories"] = activity
            }
            
            print(caloriesBurn.formattedString())
            
            
        }
        healthStore.execute(query)
        
    }
    
//    func fetchCrrentWeekRunningStats() {
//        let workout = HKSampleType.workoutType()
//        let timePredicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
//
//        let workoutPredicate = HKQuery.predicateForWorkouts(with: .running)
//
//        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [timePredicate, workoutPredicate])
//        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: 20, sortDescriptors: nil) { _, sample, error in
//
//            guard let worksouts = sample as? [HKWorkout], error == nil else{
//                print("error fetching week running data")
//                return
//            }
//
//            var count: Int = 0
//
//            for workout in worksouts {
//                let duration = Int(workout.duration)/60
//                count += duration
////                print(workout.allStatistics)
////                print(Int(workout.duration)/60)
////                print(workout.workoutActivityType)
//            }
//
//            let activity =  Activity(id: 2, title: "Running", subTitle: "Mins this week", image: "figure.walk", tintColor: <#Color#>, amount: "\(count) minutes")
//
//            DispatchQueue.main.async {
//                self.activities["weekRunning"] = activity
//            }
//        }
//
//        healthStore.execute(query)
//    }
    
//    func fetchCurrentWeekStrengthStats() {
//
//        let workout = HKSampleType.workoutType()
//        let timePredicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
//
//        let workoutPredicate = HKQuery.predicateForWorkouts(with: .traditionalStrengthTraining)
//
//        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [timePredicate, workoutPredicate])
//        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: 20, sortDescriptors: nil) { _, sample, error in
//
//            guard let worksouts = sample as? [HKWorkout], error == nil else{
//                print("error fetching week running data")
//                return
//            }
//
//            var count: Int = 0
//
//            for workout in worksouts {
//                let duration = Int(workout.duration)/60
//                count += duration
////                print(workout.allStatistics)
////                print(Int(workout.duration)/60)
////                print(workout.workoutActivityType)
//            }
//
//            let activity =  Activity(id: 3, title: "Weight Lightings", subTitle: "This week", image: "dumbbell", amount: "\(count) minutes")
//
//            DispatchQueue.main.async {
//                self.activities["weekStrength"] = activity
//            }
//        }
//
//        healthStore.execute(query)
//
//    }
    
    func fetchCurrentWeekWorkoutStats() {
        
        
        let workout = HKSampleType.workoutType()
        let timePredicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        
        let workoutPredicate = HKQuery.predicateForWorkouts(with: .traditionalStrengthTraining)
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [timePredicate, workoutPredicate])
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, sample, error in
            
            guard let worksouts = sample as? [HKWorkout], error == nil else{
                print("error fetching week running data")
                return
            }
            
            var runningcount: Int = 0
            var strengthcount: Int = 0
            var soccercount: Int = 0
            var basketballcount: Int = 0
            
            for workout in worksouts {
                
                if workout.workoutActivityType == .running {
                    
                    let duration = Int(workout.duration)/60
                    runningcount += duration
    //                print(workout.allStatistics)
    //                print(Int(workout.duration)/60)
    //                print(workout.workoutActivityType)
                    
                } else if workout.workoutActivityType == .traditionalStrengthTraining {
                    
                    let duration = Int(workout.duration)/60
                    strengthcount += duration
                    
                } else if workout.workoutActivityType == .soccer {
                    let duration = Int(workout.duration)/60
                    soccercount += duration
                    
                } else if workout.workoutActivityType == .basketball {
                    let duration = Int(workout.duration)/60
                    basketballcount += duration
                    
                }
            }
            let runningActivity =  Activity(id: 2, title: "Running", subTitle: "Mins this week", image: "figure.walk", tintColor: .green, amount: "\(runningcount) minutes")
            let strengthActivity =  Activity(id: 3, title: "Weight Lightings", subTitle: "This week", image: "dumbbell", tintColor: .cyan, amount: "\(strengthcount) minutes")
            let soccerActivity =  Activity(id: 4, title: "Scooer", subTitle: "This week", image: "figure.soccer", tintColor: .blue, amount: "\(soccercount) minutes")
            let basketballActivity =  Activity(id: 5, title: "Basketball", subTitle: "This week", image: "figure.basketball", tintColor: .orange, amount: "\(basketballcount) minutes")
            
            DispatchQueue.main.async {
                self.activities["weekRunning"] = runningActivity
                self.activities["weekStrength"] = strengthActivity
                self.activities["weekScorrer"] = soccerActivity
                self.activities["weekBasketBall"] = basketballActivity
            }
        }
        
        healthStore.execute(query)
        
        
    }
    
}


extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    static var startOfWeek: Date {
        let calender = Calendar.current
        var components = calender.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 2
        
        return calender.date(from: components)!
    }
    
    static var  oneMonthAgo: Date {
        let calender = Calendar.current

       let oneMonth = calender.date(byAdding: .month, value: -1, to: Date())
        return calender.startOfDay(for: oneMonth!)
        
    }
}

extension Double {
    func formattedString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}

// MARK: Chart Data

extension HealthManager {
    func fetchPastMonthStepdata() {
        fetchDailySteps(startDate: .oneMonthAgo) { dailySteps in
            DispatchQueue.main.async {
                self.oneMonthCharData = dailySteps
            }
            
        }
    }
}
