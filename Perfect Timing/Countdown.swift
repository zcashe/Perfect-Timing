//
//  Countdown.swift
//  Perfect Timing
//
//  Created by Zac Elders on 8/15/23.
//

import SwiftUI






func timeString(time: Int) -> String {
    let hours   = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
}



struct Countdown: View {
    //vars
    
    //interval
    @State  var interval = true
    @State  var interval_time = 0
    @State  var interval_cycle = 0
    @State  var cycle = 1
    
    
    //pomodoro
    @State  var pomodoro = false
    @State  var rest = 0

    
    
    //universal
    @State var timeRemaining = 0
    @State var TimerComplete = false
    
    
    @State var timer_time = 0
    @State private var home = false
    @State var coloring = CustomColor.countdown_blue
    
    @State var stop = false
    @State var resume = false
    
    
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var flip = false
    
    
    var body: some View {
        ZStack{
            coloring.edgesIgnoringSafeArea(.all)
            
            
            
                VStack{
                    
                    
                    // Timer
                    
                    Text("\(timeString(time: timeRemaining))")
                        .font(.system(size: 90))
                        .frame(height: 80.0)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(.white)
                    
                    
                        .onReceive(timer){ _ in
                            if self.timeRemaining > 0 {
                                
                                if stop{
                                    self.timeRemaining -= 0}
                                else{
                                    self.timeRemaining -= 1

                                }
                            }
                            else{
                                
                                if interval{
                                    if cycle == interval_cycle{
                                        
                                        TimerComplete = true
                                    }else{
                                        cycle += 1
                                        if cycle % 2 != 0{
                                            self.timeRemaining = timer_time
                                            self.coloring = CustomColor.countdown_blue
                                        }else{
                                            self.timeRemaining = interval_time
                                            self.coloring = Color.pink
                                        }
                                        
                                        //self.timeRemaining = interval_time
                                        
                                    }
                                    
                                }
                            }
                        }
                    
                    // End Timer
                    
                    // Pause and Unpause
                    if flip != true{
                        Button("  Pause     ") {
                            stop = true
                            flip = true
                        }
                        .buttonStyle(.borderedProminent)
                        .font(.title2)
                        .tint(CustomColor.blue_cancel)
                        .offset(x:0,y:100)
                        
                    }
                            else{
                            Button("  Resume     ") {
                                stop = false
                                flip = false
                            }
                            .buttonStyle(.borderedProminent)
                            .font(.title2)
                            .tint(CustomColor.blue_cancel)
                            .offset(x:0,y:100)
                            
                        }
                    // End Pause and unpause
                    
                    
                    Button("  Cancel    ") {
                        home = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(CustomColor.blue_cancel)
                    .padding()
                    .offset(x:0,y:100)
                    
                    
                }
                
                
               
                
            if home {
                    
                    ContentView()
                }
            if TimerComplete{
                
                    TimerCompleteView()
            }
                
                
            }}
}



struct TimerCompleteView: View{
    @State private var home = false
    var body: some View {
        
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            Text("Timer Complete")
                .font(.system(size: 30))
                .frame(height: 80.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
            Button("  Complete    ") {
                home = true
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(CustomColor.blue_cancel)
            .padding()
            .offset(x:0,y:100)
            }
        if home {
                
                ContentView()
            }
        }
        
    }







struct Countdown_Previews: PreviewProvider {
    static var previews: some View {
        Countdown(interval:true,interval_time:3,interval_cycle:2, timeRemaining: 5,timer_time:5)
    }
}
