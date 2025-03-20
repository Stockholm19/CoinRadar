//
//  DetailViewModel.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 20.03.2025.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .sink { (returnedCoinDetail) in
                print("RECIEVED COIN DETAILS DATA")
                print(returnedCoinDetail ?? "NO COIN DETAILS DATA")
            }
            .store(in: &cancellables)
        
        
    }
}

