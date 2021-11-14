//
//  ContentView.swift
//  pegalo
//
//  Created by Alberto Sola Comino on 14/11/21.
//

import SwiftUI

let timerInterval = 1.0

struct ContentView: View {
    let clipboard = Clipboard()
    let timer = Timer.publish(every: timerInterval, on: .main, in: .common).autoconnect()
    @State var message = "Empty clipboard"
    var body: some View {
        VStack {
            ItemView(value: message)
                .onReceive(timer, perform: { _ in
                    update()
                })
        }
        .padding(50)
    }
    
    func update() -> Void {
        let value = clipboard.getString()
        if (value != nil) {
            self.message = value!
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

