//
//  ContentView.swift
//  Landmarks
//
//  Created by ZCashe on 8/11/23.
//

import SwiftUI



struct ContentView: View {
    // View Switch Variables
    @State private var showingCountdown = false
    
    @State private var showingInterval = false
    
    @State private var showingPomodoro = false
    // End
    
    // Tab Bar Variables
    @State  var timer = true
    @State  var notes = false
    @State  var notes_color = Color.white
    @State  var timer_color = Color.black
    @State var logs = false
    // End
    
    var body: some View {
        ZStack{
            // UI design
            CustomColor.bley.edgesIgnoringSafeArea(.top)
            HStack {
                
                Image(systemName: "clock")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    
                Text("Perfect Timing")
                    .font(.title)
                    .foregroundColor(.white)
                    
                    
                    
            }
            .offset(x:0,y:-350);
            
            //RoundedRectangle(cornerRadius: 15).fill(CustomColor.secondary)
                
                //.frame(width: 250, height: 350)
                //.offset(x:0,y:-150)
            
            VStack {
             //   Text("Preset Timers")
             //       .font(.title)
             //       .fixedSize(horizontal: false, vertical: true)
              //          .multilineTextAlignment(.center)
             //           .padding()
             //           .frame(width: 200, height: 50)
                        //.background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 3))
                
                
                Button("  Study             ") {
                    showingPomodoro = true
                }
                .buttonStyle(.borderedProminent)
                
                .font(.title2)
                .tint(CustomColor.secondary)
                .padding()
                
                Spacer()
                    .frame(height: 50)
                Button("Interval Timer") {
                    showingInterval = true
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(CustomColor.secondary)
                .padding()
                Spacer()
                    .frame(height: 50)
                Button("Countdown") {
                    showingCountdown = true

                }
                
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(CustomColor.secondary)
                .padding()
                Spacer()
                    .frame(height: 50)
            }
          //  .offset(x:0,y:-150)
            
            //RoundedRectangle(cornerRadius: 15).fill(CustomColor.secondary)
                
                //.frame(width: 250, height: 350)
                //.offset(x:0,y:250)
            
           // VStack {
                
             //   Text("Customize")
             //       .font(.title)
             //       .fixedSize(horizontal: false, vertical: true)
             //           .multilineTextAlignment(.center)
              //          .padding()
             //           .frame(width: 200, height: 50)
                        //.background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 3))
                
                
              //  Button("  + Custom    ") {

              //  }
              //  .buttonStyle(.borderedProminent)
              //  .font(.title2)
              //  .tint(.pink)
              //  .padding()
              //  Button("  + Custom    ") {

              //  }
              //  .buttonStyle(.borderedProminent)
              //  .font(.title2)
              //  .tint(.blue)
              //  .padding()
                
               
               
           // }
            
                
          //  .offset(x:0,y:200)
            // End
            
            //Tab bar
            // Opted against using actual tab bar wanted to try to my own
            ZStack{
                
                Rectangle().fill(CustomColor.secondary)
                    
                    .frame(width: .infinity, height: 150)
                    .offset(x:0,y:400)
                HStack{
                    VStack{
                        
                            
                        Button {
                            
                        } label: {
                            Label("Timer", systemImage: "clock")
                        }
                        .buttonStyle(.borderedProminent)
                        .font(.title2)
                        .tint(CustomColor.secondary)
                        
                        .foregroundColor(.white)
                        
                    }
                    Text("           ")
                    
                    VStack{
                        
                        Button {
                            logs = true
                            
                        } label: {
                            Label("Logs", systemImage: "note.text")
                        }

                        .buttonStyle(.borderedProminent)
                        .font(.title2)
                        .tint(CustomColor.secondary)
                        .foregroundColor(.black)

                        
                    }
                }
                .offset(x:0,y:375)
                
            }
            // Switches view to logs
            if logs {
                
                LogsView()
            }
            
            
            // Switches to input screen
            if showingInterval {
                
                Inputs(interval:true)
            }
            
            // Switches to study screen
            if showingPomodoro {
                
                Inputs(pomodoro:true)
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


