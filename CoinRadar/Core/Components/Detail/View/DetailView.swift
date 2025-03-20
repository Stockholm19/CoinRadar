//
//  DetailView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 19.03.2025.
//

import SwiftUI

struct DetailView: View {
    @StateObject var vm: DetailViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Initializing Detail View for: \(coin.name ?? "N/A")")
    }
    
    var body: some View {
        Text("Hello")
    }
}

#Preview {
    DetailView(coin: dev.coin)
}
