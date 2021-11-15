//
//  ContentView.swift
//  pegalo
//
//  Created by Alberto Sola Comino on 14/11/21.
//

import SwiftUI

let timerInterval = 1.0

struct ClipboardItem: Identifiable {
    let value: String
    let id = UUID()
}

struct ContentView: View {
    let clipboard = Clipboard()
    let timer = Timer.publish(every: timerInterval, on: .main, in: .common).autoconnect()
    @State var items = [ClipboardItem]()
    var body: some View {
        VStack {
            List(items.reversed()){
                ItemView(value: $0.value, cb: {v in
                    clipboard.setString(v)
                })
            }
            .onReceive(timer, perform: { _ in
                update()
            })
        }
    }
    
    func update() -> Void {
        let value = clipboard.getString()
        if (value != nil && (items.first(where: {
            clipItem in
            return clipItem.value == value
        }) == nil))
        {
            self.items.append(ClipboardItem(value: value!))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

