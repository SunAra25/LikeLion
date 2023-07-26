//
//  Chap23View.swift
//  SwiftUIExample
//
//  Created by 아라 on 2023/07/24.
//

import SwiftUI

struct Chap23View: View {
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer Count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                
                Button {
                    resetCount()
                } label: {
                    Text("Reset Counter")
                }

                NavigationLink(destination: SecondView()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct Chaper23_Previews: PreviewProvider {
    static var previews: some View {
        Chap23View().environmentObject(TimerData())
    }
}
