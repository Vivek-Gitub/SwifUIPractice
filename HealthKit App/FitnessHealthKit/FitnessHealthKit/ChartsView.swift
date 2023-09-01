//
//  ChartsView.swift
//  FitnessHealthKit
//
//  Created by Vivek Patel on 28/08/23.
//

import SwiftUI
import Charts

struct DailyStepView: Identifiable {
    let id = UUID()
    let date: Date
    let stepCount: Double
}

enum chartOptions {
    case oneWeek
    case oneMonth
    case threeMonth
    case yearToDate
    case oneYear
}

struct ChartsView: View {
    @EnvironmentObject var manager: HealthManager
    @State var selectedChart: chartOptions = .oneMonth

    var body: some View {
        VStack(spacing: 12) {
            Chart {
                ForEach(manager.oneMonthCharData) { daily in
                    BarMark(x: .value(daily.date.formatted(), daily.date, unit: .day), y: .value("Steps", daily.stepCount))
                    
                }
            }
            .foregroundColor(.green)
            .frame(height: 350)
            .padding(.horizontal)
            
            HStack {
                Button("1W") {
                    print("One Week")
                    withAnimation {
                        selectedChart = .oneWeek
                    }
                    
                }
                .padding(.all)
                .foregroundColor(selectedChart == .oneWeek ? .white : .green)
                .background(selectedChart == .oneWeek ? .green : .clear)
                .cornerRadius(10)
                
                Button("1M") {
                    print("One Month")
                    withAnimation {
                        selectedChart = .oneMonth
                    }
                    

                }
                .padding(.all)
                .foregroundColor(selectedChart == .oneMonth ? .white : .green)
                .background(selectedChart == .oneMonth ? .green : .clear)
                .cornerRadius(10)
                
                Button("3M") {
                    print("Three Month")
                    
                    withAnimation {
                        selectedChart = .threeMonth
                    }
                    

                }
                .padding(.all)
                .foregroundColor(selectedChart == .threeMonth ? .white : .green)
                .background(selectedChart == .threeMonth ? .green : .clear)
                .cornerRadius(10)
                
                Button("YTD") {
                    print("Year To Date")
                    withAnimation {
                        selectedChart = .yearToDate
                    }
                    

                }
                .padding(.all)
                .foregroundColor(selectedChart == .yearToDate ? .white : .green)
                .background(selectedChart == .yearToDate ? .green : .clear)
                .cornerRadius(10)
                
                Button("1Y") {
                    print("One Year")
                    withAnimation
                    {
                        selectedChart = .oneYear
                    }
                }
                .padding(.all)
                .foregroundColor(selectedChart == .oneYear ? .white : .green)
                .background(selectedChart == .oneYear ? .green : .clear)
                .cornerRadius(10)
                
            }

        } .onAppear {
            print(manager.oneMonthCharData)
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
            .environmentObject(HealthManager())
    }
}
