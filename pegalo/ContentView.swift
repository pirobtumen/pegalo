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
            HStack {
                Button(action: {
                    items.removeAll()
                    clipboard.clear()
                }) {
                    Text("Clear")
                }
            }
            
            List{
                ForEach(items.indices.reversed(), id: \.self) { index in
                    ClipItemView(value: items[index].value, cb: {v in
                        clipboard.setString(v)
                    })
                        .listRowBackground(
                            (index % 2 == 0) ? Color(.systemGray) : Color(.white)
                        )
                }
                
            }
            .onReceive(timer, perform: { _ in
                update()
            })
        }
        .padding(10)
    }
    
    func update() -> Void {
        let value = clipboard.getString()
        if (value != nil && value != "" && (items.first(where: {
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

