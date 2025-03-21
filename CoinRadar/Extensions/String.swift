//
//  String.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 21.03.2025.
//

import Foundation

extension String {
    
    var removeingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}

