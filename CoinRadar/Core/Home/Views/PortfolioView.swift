//
//  PortfolioView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 10.03.2025.
//

import SwiftUI

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var isPresented: Bool
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(searchText: $vm.searchText)
            coinLogoList
            portfolioInputSection
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(.systemBackground).ignoresSafeArea())
        .navigationTitle("Edit Portfolio")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                XMarkButton(isPresented: $isPresented)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                trailingNavBarButtons
            }
        }
        .presentationDetents([.large])
    }
}

#Preview {
    NavigationView {
        PortfolioView(isPresented: .constant(false))
            .environmentObject(dev.homeVM)
    }
}

extension PortfolioView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                selectedCoin = (selectedCoin?.id == coin.id) ? nil : coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(selectedCoin?.symbol?.uppercased() != nil ?
                     "Current price of \(selectedCoin!.symbol!.uppercased())" :
                     "Select a coin to see the price:")
                     .foregroundColor(selectedCoin == nil ? .gray : .primary)
                Spacer()
                Text(selectedCoin?.currentPrice?.asCurrencyWith6Decimals() ?? "")
                    .font(.title3)
            }
            
            Divider()
            
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 80)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .transaction { $0.animation = nil }
        
    }
    
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10.0) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
            })
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ?
                1.0 : 0.0
            )
        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        
        guard let coin = selectedCoin else { return }
        
        // Save to portfolio
        
        
        // Show checkmark
        withAnimation(.easeInOut) {
            showCheckMark = true
            removeSelectedCoin()
        }
        
        // Hide keyboard
        UIApplication.shared.endEditing()
        
        // Hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut) {
                showCheckMark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}
