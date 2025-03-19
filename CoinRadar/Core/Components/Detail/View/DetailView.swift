//
//  DetailView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 19.03.2025.
//

import SwiftUI

struct DetailView: View {
    
    let coin: CoinModel
    
    var body: some View {
        Text(coin.name ?? "N/A")
    }
}

#Preview {
    DetailView(coin: dev.coin)
}
