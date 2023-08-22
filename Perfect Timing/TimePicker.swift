//
//  TimePicker.swift
//  Perfect Timing
//
//  Created by ZCashe on 8/16/23.
//

import SwiftUI



extension UIPickerView{
    open override var intrinsicContentSize: CGSize{
        CGSize(
            width: UIView.noIntrinsicMetric,
            height: super.intrinsicContentSize.height)
    }
}

struct TimePickerView: View {
     
    private let pickerViewTitlePadding: CGFloat = 5.0

    let title: String
    let range: ClosedRange<Int>
    let binding: Binding<Int>

    var body: some View {
        HStack(spacing: -pickerViewTitlePadding) {
            Picker(title, selection: binding) {
                ForEach(range, id: \.self) { timeIncrement in
                    HStack {
                        // Forces the text in the Picker to be
                        // right-aligned
                        Spacer()
                        Text("\(timeIncrement)")
                            
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .pickerStyle(InlinePickerStyle())
            .labelsHidden()
            .frame(width:65)
            
            

            Text(title)
                .foregroundColor(.white)
                .bold()
                
        }
    }
}



class TimerViewModel: ObservableObject {
    @Published var selectedIntervalsAmount = 10
    @Published var selectedMinutesAmount = 10
    @Published var selectedSecondsAmount = 10
    @Published var IntervalSecondsAmount = 10
    @Published var IntervalMinutesAmount = 10
    
    
    
    
    
    let intervalRange = 1...23
    let minutesRange = 0...59
    let secondsRange = 0...59
}









