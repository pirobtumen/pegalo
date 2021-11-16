import SwiftUI

struct ClipItemView: View {
    let value: String
    let onCopy: (_ value: String) -> Void
    let onDelete: (_ value: String) -> Void
    var body: some View {
        HStack {
            Text(value)
                .truncationMode(.tail)
                .frame(width: 300, height: 25)
            Button(action: {
                onDelete(value)
            }) {
                Image(systemName: "trash.fill")
            }
            Button(action: {
                onCopy(value)
            }) {
                Image(systemName: "doc.on.doc.fill")
            }
        }
    }
}
