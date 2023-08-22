//
//  LogsView.swift
//  Perfect Timing
//
//  Created by ZCashe on 8/20/23.
//

import SwiftUI

struct LogsView: View {
    @State var timer = false
    
    
    @State var items: [LogNote] = {
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        if let json = try? JSONDecoder().decode([LogNote].self, from: data) {
            return json
        }
        return []
    }()
    
    @State var taskText: String = ""
    
    @State var showAlert = false
    
    @State var itemToDelete: LogNote?
    
    var alert: Alert {
        Alert(title: Text("Delete Log?"),
              
              
              
              
              
              primaryButton: .destructive(Text("Delete"), action: deleteNote),
              secondaryButton: .cancel())
    }
    
    
    func deleteNote() {
        guard let itemToDelete = itemToDelete else { return }
        items = items.filter { $0 != itemToDelete }
        save()
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: "notes")
    }
    
    
    
    var body: some View {
        
        ZStack{
            CustomColor.bley.edgesIgnoringSafeArea(.top)
            
            
            
            
            // Logs variables
            VStack{
                Text("Logs:")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                if items.isEmpty == false{
                    HStack{
                        Spacer()
                        
                        List(items) { item in
                            VStack(alignment: .leading) {
                                Text(item.dateText).font(.headline)
                                Text(item.text).lineLimit(nil).multilineTextAlignment(.leading)
                            }
                            
                            
                            
                            
                            .onLongPressGesture {
                                self.itemToDelete = item
                                self.showAlert = true
                                
                            }
                        }
                        
                        .alert(isPresented: $showAlert, content: {
                            alert
                        })
                        .background(CustomColor.bley)
                        .scrollContentBackground(.hidden)
                        
                        
                    }}
                
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            // Logs
            
            
            
            
            //Tab Bar
            ZStack{
                
                Rectangle().fill(CustomColor.secondary)
                    
                    .frame(width: .infinity, height: 150)
                    .offset(x:0,y:400)
                HStack{
                    VStack{
                        
                            
                        Button {
                            timer = true
                        } label: {
                            Label("Timer", systemImage: "clock")
                        }
                        .buttonStyle(.borderedProminent)
                        .font(.title2)
                        .tint(CustomColor.secondary)
                        
                        .foregroundColor(.black)
                        
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
                        .foregroundColor(.white)

                        
                    }
                }
                .offset(x:0,y:375)
                
            }
            if timer {
                
                ContentView()
            }
            
            //Tab bar
        }
        
    }
}




struct LogsView_Previews: PreviewProvider {
    static var previews: some View {
        LogsView()
    }
}
