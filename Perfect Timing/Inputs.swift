//
//  Inputs.swift
//  Perfect Timing
//
//  Created by ZCashe on 8/15/23.
//

import SwiftUI

struct Inputs: View {
    
    @State private var score = 0
    @State private var home = false
    @State private var final = false
    @State var interval = true
    @State var pomodoro = false
    
    //Interval
    @State var timer_time = 0
    @State  var interval_time = 0
    @State  var interval_cycle = 0
    @State  var cycle = 1
    @State var init_itv = false
    //
    
    @StateObject private var TimerModel = TimerViewModel()
    
    
    var body: some View {
        
        
        
        ZStack{
            
            CustomColor.bley.edgesIgnoringSafeArea(.all)
            if interval{
                VStack{
                    Text("Create interval Timer")
                        .font(.title)

                        .foregroundColor(.white)
                    
                    
                    HStack{
                        Spacer()
                        Text("Intervals:")
                        
                            .foregroundColor(.white)
                            .font(.system(size: 23))
                            .padding()
                        Spacer()
                        TimePickerView(title: "",
                            range: TimerModel.intervalRange,
                            binding: $TimerModel.selectedIntervalsAmount)
                        .offset(x:0,y:0)
                        Spacer()
                        
                    }
                    
                    
                    
                    
                    HStack{
                        
                        Text(" Timer Length: ")
                        
                            .foregroundColor(.white)
                            .font(.system(size: 23))
                            .padding()
                        TimePickerView(title: "  :",
                            range: TimerModel.minutesRange,
                            binding: $TimerModel.selectedMinutesAmount)
                        .offset(x:0,y:0)
                        .foregroundColor(.white)
                        
                        TimePickerView(title: "",
                            range: TimerModel.secondsRange,
                            binding: $TimerModel.selectedSecondsAmount)
                    }
                    HStack{
                        Text("Interval Length: ")
                        
                            .foregroundColor(.white)
                            .font(.system(size: 23))
                            .padding()
                        TimePickerView(title: "   :",
                            range: TimerModel.minutesRange,
                            binding: $TimerModel.IntervalMinutesAmount)
                        
                        TimePickerView(title: "",
                            range: TimerModel.secondsRange,
                            binding: $TimerModel.IntervalSecondsAmount)
                        .foregroundColor(.white)
                        
                        
                    
                    }
                    Button("Continue   "){
                    
                                
                                    init_itv = true
                                
                            
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(CustomColor.secondary)
                    .padding()
                    .offset(x:0,y:00)
                
                    
                    Button("  Cancel     ") {
                        home = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(CustomColor.secondary)
                    .padding()
                    .offset(x:0,y:00)
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
                
                Countdown(interval:true,
                interval_time:TimerModel.IntervalMinutesAmount * 60 + TimerModel.IntervalSecondsAmount,
                          
                interval_cycle:TimerModel.selectedIntervalsAmount * 2,
                          
                timeRemaining: TimerModel.selectedMinutesAmount * 60 + TimerModel.selectedSecondsAmount,
                          
                timer_time:TimerModel.selectedMinutesAmount * 60+TimerModel.selectedSecondsAmount)
            }
                
        }
    }
}

struct Inputs_Previews: PreviewProvider {
    static var previews: some View {
        Inputs()
    }
}
