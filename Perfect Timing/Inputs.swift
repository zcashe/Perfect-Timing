//
//  Inputs.swift
//  Perfect Timing
//
//  Created by Zac Elders on 8/15/23.
//

import SwiftUI

struct Inputs: View {
    
    
    @State private var home = false
    @State private var final = false
    @State var interval = false
    @State var pomodoro = true
    
    
    
    var body: some View {
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            if interval{
                VStack{
                    Button("  Pause     ") { final = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(Color.white)
                    
                    .offset(x:0,y:100)
                    Button("  Cancel    ") {
                        home = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(CustomColor.blue_cancel)
                    .padding()
                    .offset(x:0,y:100)
                }}
            if pomodoro{
                VStack{
                    Button("  Pause     ") { final = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(Color.black)
                    
                    .offset(x:0,y:100)
                    Button("  Cancel    ") {
                        home = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(CustomColor.blue_cancel)
                    .padding()
                    .offset(x:0,y:100)
                }}
            if home {
                    
                    ContentView()
                }
            if final{
                
                Countdown(interval:true,interval_time:3,interval_cycle:2,timeRemaining: 5,timer_time:5)
            }
        }
    }
}

struct Inputs_Previews: PreviewProvider {
    static var previews: some View {
        Inputs()
    }
}
