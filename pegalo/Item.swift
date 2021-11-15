//
//  Item.swift
//  pegalo
//
//  Created by Alberto Sola Comino on 14/11/21.
//

import SwiftUI

struct ItemView: View {
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
