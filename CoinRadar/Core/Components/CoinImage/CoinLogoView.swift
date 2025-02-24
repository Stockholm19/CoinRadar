//
//  CoinLogoView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 10.03.2025.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
                Text(coin.symbol?.uppercased() ?? "N/A")
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            Text(coin.name ?? "N/A")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
        CoinLogoView(coin: dev.coin)
}
