//
//  CustomerTextField.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 16/08/22.
//

import SwiftUI

struct CustomerTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = { _ in }
    var commit: () -> () = { }
//
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }

            TextField(
                "",
                text: $text,
                onEditingChanged: editingChanged,
                onCommit: commit
            )
                .foregroundColor(.gray)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
        }
    }
}

struct CustomerTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomerTextField(placeholder: Text("Email"), text: .constant(""))
    }
}
