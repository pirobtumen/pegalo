import Foundation
import SwiftUI

struct Clipboard {
    let pasteboard = NSPasteboard.general

    func getString() -> String? {
        return pasteboard.string(forType: .string)
    }
    
    func setString(_ value: String) -> Void {
        pasteboard.clearContents()
        let _ = pasteboard.setString(value, forType: NSPasteboard.PasteboardType.string)
        // TODO Check result is true
    }
    
    func clear() {
        setString("")
    }
}
