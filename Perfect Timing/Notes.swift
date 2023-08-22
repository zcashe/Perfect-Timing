//
//  Notes.swift
//  Perfect Timing
//
//  Created by ZCashe on 8/20/23.
//


// Notes struct from https://gist.github.com/jnewc/35692b2a5985c3c99e847ec56098a451


import SwiftUI

let dateFormatter = DateFormatter()


// This will create the note that we display to the screen so for every use of the timer we want to have it updating with the type of workout, and any personal notes

// Variables needed Interval - length, cycles, time, bool
struct LogNote: Codable, Hashable, Identifiable {
    let id: Int
    let text: String
    var date = Date()
    var dateText: String {
        dateFormatter.dateFormat = "MMM d yyyy, h:mm a"
        return dateFormatter.string(from: date)
    }
}
//





