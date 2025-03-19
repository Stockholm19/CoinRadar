//
//  DetailView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 19.03.2025.
//

import SwiftUI

struct DetailView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing Detail View for: \(coin.name ?? "N/A")")
    }
    
    var body: some View {
        Text(coin.name ?? "N/A")
    }
}

#Preview {
    DetailView(coin: dev.coin)
}
