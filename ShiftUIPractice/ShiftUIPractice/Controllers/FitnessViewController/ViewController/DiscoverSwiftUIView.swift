    //
    //  DiscoverSwiftUIView.swift
    //  ShiftUIPractice
    //
    //  Created by Vivek Patel on 31/08/23.
    //

    import SwiftUI

    struct DiscoverSwiftUIView: View {
        //    var markHeaderCardData = [HeaderCard]()
        
            @State private var markHeaderCardData:[HeaderCard] = [
            HeaderCard(id: 0, headingTitle: "Home Workout", descriptionTitle: "12 Exercise", starRating: "4.9"),
            HeaderCard(id: 1, headingTitle: "Hand Exercise", descriptionTitle: "20 Exercise", starRating: "1.9"),
            HeaderCard(id: 2, headingTitle: "Chest Workout  ", descriptionTitle: "89 Exercise", starRating: "8.9"),
            HeaderCard(id: 4, headingTitle: "Leg Worktout", descriptionTitle: "34 Exercise", starRating: "5.9"),
            
            HeaderCard(id: 5, headingTitle: "Push Up Worktout", descriptionTitle: "22 Exercise", starRating: "3.8")
            
        ]
        
        var body: some View {
            
            NavigationView {
                
                VStack(alignment: .leading) {
                    // Headre section
                    headerDiscoverView(markHeaderCardData: $markHeaderCardData)
                    Spacer()
                    
                    // Footer section
                    footerDiscoverView()
                    Spacer()
                    
                }
                .navigationBarItems(leading: Text("Discover")
                    .font(.custom("Helvetica", size: 26))
                    .bold(), trailing: Button(action: {
                        print("Button clciked")
                    }) {
                        Image(systemName: "bell")
                            .foregroundColor(.black).frame(width: 8,height: 8)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 12))
                        
                    }
                ).frame(maxWidth: .infinity, maxHeight: .infinity).padding(.horizontal,20)
            }
            
        }
    }


    struct headerDiscoverView: View {
        
        @Binding var markHeaderCardData: [HeaderCard]
        
        var body: some View {
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Popular Exercises").font(.custom("Helvetica", size: 18)).bold()
                    
                    Spacer()
                    
                    Button(action: {
                        print("Click on see More button")
                    }) {
                        Text("See more").foregroundColor(.black)
                        
                        Image(systemName: "arrowshape.turn.up.right.fill").foregroundColor(.black)
                        
                    }
                    
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
                
                
                // Header scrollView
                
                
                ScrollView(.horizontal,showsIndicators: false) {
                    
                    LazyHStack(spacing: 10) {
                        ForEach(markHeaderCardData, id: \.id) {
                            headercard in
                            headerCardView(headerCard: headercard).frame(width: 200, height: 190)
                        }
                    }
                    
                    
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: 220,alignment: .topLeading)
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
            
        }
        
        
    }


    struct footerDiscoverView: View {
        var body: some View {
            
            Text("Our Collection")
                .font(.custom("Helvetica", size: 18))
                .fontWeight(.regular)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            
            
            // Footer Scroll view
            
            
            ScrollView(.vertical,showsIndicators: false) {
                
                LazyVStack(spacing: 20) {
                    ForEach(0..<5, id: \.self) {
                        index in
                        FooterCardView(footerCard: FooterCard(id: 0, title: "Chest & abdominal exercises", numberOfExercise: 12)).frame(width: .infinity, height: 120)
                    }
                }
                
                
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topLeading)
            
        }
    }

    struct DiscoverSwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            DiscoverSwiftUIView()
        }
    }
