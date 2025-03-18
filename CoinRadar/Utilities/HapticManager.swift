//
//  HapticManager.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 18.03.2025.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
