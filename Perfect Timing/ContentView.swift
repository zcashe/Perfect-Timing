//
//  ContentView.swift
//  Landmarks
//
//  Created by Zac Elders on 8/11/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var showingCountdown = false
    
    @State private var showingInterval = false
    
    @State private var showingPomodoro = false
    
    
    var body: some View {
        ZStack{
            CustomColor.bley.edgesIgnoringSafeArea(.all)
            HStack {
                
                Image(systemName: "clock")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    
                Text("Perfect Timing")
                    .font(.title)
                    .foregroundColor(.white)
                    
                    
                    
            }
            .offset(x:0,y:-375);
            
            RoundedRectangle(cornerRadius: 15).fill(CustomColor.secondary)
                
                .frame(width: 250, height: 350)
                .offset(x:0,y:-150)
            
            VStack {
                Text("Preset Timers")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 3))
                
                
                Button("  Pomodoro    ") {
                    showingPomodoro = true
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.pink)
                .padding()
                Button("Interval Timer") {
                    showingInterval = true
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.blue)
                .padding()
                
                Button("Countdown") {
                    showingCountdown = true

                }
                
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.green)
                .padding()
            }
            .offset(x:0,y:-150)
            
            RoundedRectangle(cornerRadius: 15).fill(CustomColor.secondary)
                
                .frame(width: 250, height: 350)
                .offset(x:0,y:250)
            
            VStack {
                Text("Customize")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 3))
                
                
                Button("  + Custom    ") {

                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.pink)
                .padding()
                Button("  + Custom    ") {

                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.blue)
                .padding()
                Button("  + Custom    ") {

                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.black)
                .padding()
            }
            .offset(x:0,y:250)
            
            
            if showingInterval {
                
                Inputs(interval:true)
            }
            if showingPomodoro {
                
                Inputs(pomodoro:true)
            }
            
        }}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


