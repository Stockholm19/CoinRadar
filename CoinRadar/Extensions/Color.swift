//
//  Color.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 24.02.2025.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
    
}


struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    let cardBackground = Color("CardBackgroundSettings")
}

struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}
