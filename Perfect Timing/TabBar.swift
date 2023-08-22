//
//  TabBar.swift
//  Perfect Timing
//
//  Created by ZCashe on 8/20/23.
//

import SwiftUI

struct TabBar: View {
    @State  var timer = true
    @State  var notes = false
    @State  var notes_color = Color.white
    @State  var timer_color = Color.black
    
    
    var body: some View {
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
                    
                    .foregroundColor(timer_color)
                    
                }
                Text("           ")
                
                VStack{
                    
                    Button {
                        
                    } label: {
                        Label("Logs", systemImage: "note.text")
                    }

                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .tint(CustomColor.secondary)
                    .foregroundColor(notes_color)

                    
                }
            }
            .offset(x:0,y:375)
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
