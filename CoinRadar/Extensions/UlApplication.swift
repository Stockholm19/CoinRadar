//
//  UlApplication.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 08.03.2025.
//

import SwiftUI
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
