//
//  UIApplication+extension.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 17/08/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
