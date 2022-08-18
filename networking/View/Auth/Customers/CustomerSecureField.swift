//
//  CustomerSecureField.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 16/08/22.
//

import SwiftUI

struct CustomerSecureField: View {
    var placeholder: Text
    @Binding var text: String
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
           if text.isEmpty { placeholder }
           
           SecureField(
            "",
            text: $text,
            onCommit: commit
           )
           .foregroundColor(.gray)
       }
    }
}

struct CustomerSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomerSecureField(placeholder: Text("Senha"), text: .constant(""))
    }
}
