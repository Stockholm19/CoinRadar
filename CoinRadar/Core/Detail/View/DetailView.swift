//
//  DetailView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 19.03.2025.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription: Bool = false
    
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
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    ChartView(coin: vm.coin)
                        .padding(.vertical)
                    VStack(spacing: 20.0) {
                        
                        overviewTitle
                        Divider()
                        descriptionSection
                        overviewGrid
                        additionalTitle
                        Divider()
                        additionalGrid
                        websiteSection
                        
                    }
                    .padding()
                }
            }
            .navigationTitle(vm.coin.name ?? "")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigitionBarTrailingItems
                }
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
    
    private var descriptionSection: some View {
        ZStack {
            if let coinDescription = vm.coinDescription,
                !coinDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Button(action: {
                       withAnimation(.easeInOut) {
                           showFullDescription.toggle()
                       }
                    }, label: {
                        Text(showFullDescription ? "Less" : "Read more...")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    })
                    .accentColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }
        }
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
    
    private var websiteSection: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            if let websiteString = vm.websiteURL,
               let url = URL(string: websiteString) {
                Link("Website", destination: url)
            }
            
            if let redditString = vm.redditURL,
               let url = URL(string: redditString) {
                Link("Reddit", destination: url)
            }
            
        }
        .accentColor(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
    }
}

