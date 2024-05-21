//
//  ContentView.swift
//  Timer
//
//  Created by apprenant65 on 21/05/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var minuteurManager = MinuteurManager()
    
    @State var selectedTime = 0
    let minutes = Array(0 ... 59)
    
    var body: some View {
        NavigationView {
            VStack {
                Text(MinutesAndSeconds(secondes:minuteurManager.secondeRestantes))
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: minuteurManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .font(.system(size: 180))
                    .foregroundColor(.red)
                    .onTapGesture(perform: {
                        if self.minuteurManager.timerMode == .initial {
                            self.minuteurManager.setMinuteurFormat(minutes: self.minutes[self.selectedTime]*60)
                        }
                        self.minuteurManager.timerMode == .running  ? self.minuteurManager.pause() : self.minuteurManager.start()
                    })
                
                
                if minuteurManager.timerMode == .pause {
                    Image(systemName: "gobackward")
                        .font(.system(size: 50))
                        .padding(.top, 40)
                        .onTapGesture(perform: {
                            self.minuteurManager.reset()
                        })
                }
                
                if minuteurManager.timerMode == .initial {
                    Picker(selection: $selectedTime, label: Text("")) {
                        ForEach(1 ..< minutes.count){
                            Text("\(self.minutes[$0]) min")
                        }
                    }
                    .pickerStyle(.wheel)
                    .labelsHidden()
                }
                Spacer()
            }
            .navigationTitle("Timer")
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ContentView()
}
