//
//  TimerManager.swift
//  Timer
//
//  Created by apprenant65 on 21/05/2024.
//

import Foundation
import SwiftUI

class MinuteurManager : ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    
    @Published var secondeRestantes = UserDefaults.standard.integer(forKey: "LongueurMinuteur")
    
    var minuteur = Timer()
    
    func start() {
        timerMode = .running
        
        minuteur = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {minuteur in
            if self.secondeRestantes == 0 {
                self.reset()
            }
            self.secondeRestantes -= 1
        })
    }
    
    func reset() {
        self.timerMode = .initial
        self.secondeRestantes = UserDefaults.standard.integer(forKey: "LongueurMinuteur")
        minuteur.invalidate()
    }
    
    func pause() {
        self.timerMode = .pause
        minuteur.invalidate()
    }
    
    func setMinuteurFormat (minutes : Int) {
        let userDefault = UserDefaults.standard
        userDefault.setValue(minutes, forKey: "LongueurMinuteur")
    }
}
