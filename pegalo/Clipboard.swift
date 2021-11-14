//
//  Clipboard.swift
//  pegalo
//
//  Created by Alberto Sola Comino on 14/11/21.
//

import Foundation
import SwiftUI

struct Clipboard {
    let pasteboard = NSPasteboard.general

    func getString() -> String? {
        return pasteboard.string(forType: .string)
    }
}
