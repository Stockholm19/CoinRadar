//
//  PortfolioDataService.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 12.03.2025.
//

import Foundation
import CoreData

class PortfolioDataService {
        
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("❌ Error loading Core Data! \(error)")
            }
            self.getPortfolio()
        }
    }
    
    // MARK: PUBLIC
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        // check if coin is already in portfolio
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
          
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                remove(entity: entity)
            }
            
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    // MARK: PRIVATE
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: "PortfolioEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("❌ Error fetching Portfolio Entities: \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChange()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChange()
    }
    
    private func remove(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChange()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch {
            print("❌ Error saving to Core Data! \(error)")
        }
    }
    
    private func applyChange() {
        save()
        getPortfolio()
    }
}

