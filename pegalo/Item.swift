import SwiftUI

struct ClipItemView: View {
    let value: String
    let cb: (_ value: String) -> Void
    var body: some View {
        HStack {
            Text(value)
            Button(action: {
                cb(value)
            }) {
                Text("Copy")
            }
        }
    }
}
