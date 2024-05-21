//
//  Helper.swift
//  Timer
//
//  Created by apprenant65 on 21/05/2024.
//

import Foundation

enum TimerMode {
    case initial
    case running
    case pause
}

func MinutesAndSeconds(secondes: Int) -> String {
    let minutes = "\((secondes % 3600)/60)"
    let secondes = "\((secondes % 3600)%60)"
    
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondeStamp = secondes.count > 1 ? secondes : "0" + secondes
    
    return "\(minuteStamp) : \(secondeStamp)"
}
