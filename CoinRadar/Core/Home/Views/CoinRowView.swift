//
//  CoinRowView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 26.02.2025.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0.0) {
            leftColumn
                Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
        .preferredColorScheme(.dark)
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0.0) {
          Text("\(coin.rank)")
              .font(.caption)
              .foregroundColor(Color.theme.secondaryText)
              .frame(minWidth: 30)
            CoinImageView(coin: coin)
              .frame(width: 30, height: 30)
          Text(coin.symbol?.uppercased() ?? "")
              .font(.headline)
              .padding(.leading, 6)
              .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .leading) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack {
            Text(coin.currentPrice?.asCurrencyWith6Decimals() ?? "-")
                .bold()
                .foregroundColor(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "-")
            
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green :
                    Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
