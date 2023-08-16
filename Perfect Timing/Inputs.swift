//
//  Inputs.swift
//  Perfect Timing
//
//  Created by Zac Elders on 8/15/23.
//

import SwiftUI

struct Inputs: View {
    
    @State private var score = 0
    @State private var home = false
    @State private var final = false
    @State var interval = false
    @State var pomodoro = false
    
    //Interval
    @State var timer_time = 0
    @State  var interval_time = 0
    @State  var interval_cycle = 0
    @State  var cycle = 1
    @State var init_itv = false
    //
    
    
    
    var body: some View {
        ZStack{
            CustomColor.bley.edgesIgnoringSafeArea(.all)
            if interval{
                VStack{
                    Text("Create interval Timer")
                        .font(.title)

                        .foregroundColor(.white)
                    
                    
                    HStack{
                        
                        Text("Intervals:")
                        
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .padding()
                        TextField("", value: $interval_cycle, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                        Spacer()
                    }
                    
                    
                    
                    
                    HStack{
                        
                        Text(" Timer Length (min.)")
                        
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .padding()
                        TextField("", value: $timer_time, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                        Spacer()
                    }
                    HStack{
                        Text("Interval Length (sec.)")
                        
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding()
                        TextField("Enter your score", value: $interval_time, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                        
                    
                    }
                    Button("Continue   "){
                    
                                
                                    init_itv = true
                                
                            
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(CustomColor.blue_cancel)
                    .padding()
                    .offset(x:0,y:100)
                
                    
                    Button("  Cancel    ") {
                        home = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(CustomColor.blue_cancel)
                    .padding()
                    .offset(x:0,y:100)
                        }
                
                    }
            if pomodoro{
                VStack{
                    TextField("Enter your score", value: $score, format: .number)
                                    .textFieldStyle(.roundedBorder)
                    
                                    .padding()
                    
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
            if init_itv{
                
                Countdown(interval:true,interval_time:interval_time,interval_cycle:interval_cycle*2,timeRemaining: timer_time*60,timer_time:timer_time*60)
            }
        }
    }
}

struct Inputs_Previews: PreviewProvider {
    static var previews: some View {
        Inputs()
    }
}
