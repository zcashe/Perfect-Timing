//
//  Countdown.swift
//  Perfect Timing
//
//  Created by ZCashe on 8/15/23.
//

import SwiftUI

import AVFoundation

// Notes Logic help https://gist.github.com/jnewc/35692b2a5985c3c99e847ec56098a451


// Function to convert number to time string format
// Don't know if i want hours for sure yet

func timeString(time: Int) -> String {
   // let hours   = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    //return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    return String(format:"%02i:%02i", minutes, seconds)
}
func HourtimeString(time: Int) -> String {
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
    
    // Timer vars
    @State var timer_time = 0
    @State private var home = false
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var flip = false
    
    
    // Pausing/Resume/Cancel Button Vars
    @State var coloring = CustomColor.countdown_blue
    @State var button_colors = CustomColor.blue_cancel
    @State var stop = false
    @State var resume = false
    
    
    
    
    
    //Sound
    @State var soundOn = true
    func PlaySound(){
        if soundOn{
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(1012)) {   }
            soundOn = false
        }}
    
    // View
    var body: some View {
        ZStack{
            
            coloring.edgesIgnoringSafeArea(.all)
            
            
            
                VStack{
                    
                    
                    // Timer
                    
                    Text("\(timeString(time: timeRemaining))")
                        .font(.system(size: 120))
                        .frame(height: 80.0)
                        .frame(width: .infinity)
                        .foregroundColor(.white)
                    
                    // Cycling Logic and Sound
                        .onReceive(timer){ _ in
                            if self.timeRemaining > 0 {
                                
                                if stop
                                {
                                    self.timeRemaining -= 0
                                    
                                }
                                else
                                {
                                    self.timeRemaining -= 1

                                }
                            }
                            else
                            {
                                // Interval Logic
                                if interval
                                {
                                    
                                    
                                    if cycle == interval_cycle
                                    {
                                        PlaySound()
                                        TimerComplete = true
                                    }
                                    else
                                    {
                                        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(1012)) {   }
                                        
                                       
                                        cycle += 1
                                        if cycle % 2 != 0
                                            // Interval and Color flipping
                                        {
                                            self.timeRemaining = timer_time
                                            self.coloring = CustomColor.countdown_blue
                                            self.button_colors = CustomColor.blue_cancel
                                        }
                                        else
                                        {
                                            self.timeRemaining = interval_time
                                            self.coloring = Color.pink
                                            self.button_colors = Color.red
                                        }
                                        
                                       
                                        
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
                        .tint(coloring)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 4))
                        .offset(x:0,y:100)
                        
                    }
                            else{
                            Button("  Resume     ") {
                                stop = false
                                flip = false
                            }
                            .buttonStyle(.borderedProminent)
                            .font(.title2)
                            .tint(coloring)
                            .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white, lineWidth: 4))
                            .offset(x:0,y:100)
                            
                        }
                    // End Pause and unpause
                    
                    
                    Button("  Cancel    ") {
                        home = true
                        stop = true
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(coloring)
                    .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 4))
                    .padding()
                    .offset(x:0,y:100)
                    
                    
                }
                
                
               
                
            if home {
                    
                    ContentView()
                }
            if TimerComplete{
                
                    TimerCompleteView()
            }
                
                
            }
        
    }
}



struct TimerCompleteView: View{
    @State private var home = false
    
    
    
    // Log variables
    @State var items: [LogNote] = {
        // Guard checks if the data exists first
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        // Returns the dictionary information
        if let json = try? JSONDecoder().decode([LogNote].self, from: data) {
            return json
        }
        return []
    }()
    
    @State var LogText: String = ""
    
    
    
    var inputView: some View {
        HStack {
            Spacer()
            
                .frame(width:40)
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .frame(width:400, height: 100)
                    
                    .foregroundColor(.white)
                    .offset(y:0)
                TextField("Write a note ...", text: $LogText, axis:.vertical)
                    .textFieldStyle(.roundedBorder)
                
                    .lineLimit(4)
                
                    .background(.white)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .clipped()
                    .foregroundColor(.black)
                    //.frame(height:60)
            }
            Spacer()
                .frame(width:40)
            //Button(action: didTapAddTask, label: { Text("Add") }).padding(8)
        }
    }

    
    var body: some View {
        
        
        ZStack{
            
            Color.green.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Timer Complete")
                    .font(.system(size: 30))
                    .frame(height: 80.0)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.white)
                
                // Logging Logic
                inputView
                
                
                Button(" Complete ") {
                    AddLog()
                    home = true
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.green)
                .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5))
                .padding()
                .offset(x:0,y:100)
            }
            
        }
        if home {
                
                ContentView()
            }
        
        }
        
    func AddLog() {
        let id = items.reduce(0) { max($0, $1.id) } + 1
        items.insert(LogNote(id: id, text: LogText), at: 0)
        LogText = ""
        save()
        
    
    }
    // Encodes as Json and if it can't sets as UserDefaults
    func save() {
       guard let data = try? JSONEncoder().encode(items) else { return }
       UserDefaults.standard.set(data, forKey: "notes")
    }
    
        
    }







struct Countdown_Previews: PreviewProvider {
    static var previews: some View {
        Countdown(interval:true,interval_time:3,interval_cycle:2, timeRemaining: 5,timer_time:5)
    }
}
