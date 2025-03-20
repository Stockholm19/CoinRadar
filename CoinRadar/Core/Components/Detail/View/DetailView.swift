//
//  DetailView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 19.03.2025.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30.0
        
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
//        print("Initializing Detail View for: \(coin.name ?? "N/A")")
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                Text("")
                    .frame(height: 150)
                
                overviewTitle
                Divider()
                overviewGrid
                additionalTitle
                Divider()
                additionalGrid
            }
            .padding()
        }
        .navigationTitle(vm.coin.name ?? "")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                navigitionBarTrailingItems
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(coin: dev.coin)
    }
}

extension DetailView {
    
    private var navigitionBarTrailingItems: some View {
        HStack {
            Text(vm.coin.symbol?.uppercased() ?? "")
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(vm.overviewStatistics) { stat in
                    StatisticView(stat: stat)
                }
            }
        )
    }
    
    private var additionalGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(vm.additionalStatistics) { stat in
                    StatisticView(stat: stat)
                }
            }
        )
    }
}

