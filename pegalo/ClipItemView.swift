import SwiftUI

struct ClipItemView: View {
    let value: String
    let cb: (_ value: String) -> Void
    var body: some View {
        HStack {
            Text(value)
                .truncationMode(.tail)
                .frame(width: 300, height: 25)
            Button(action: {
                cb(value)
            }) {
                Text("Copy")
            }
        }
    }
}
