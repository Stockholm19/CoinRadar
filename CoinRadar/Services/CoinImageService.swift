//
//   CoinImageService.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 06.03.2025.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName: String = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id ?? "default_image"
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let coinID = coin.id else {
            print("❌ Error: coin.id is nil")
            return
        }
        
        if let savedImage = fileManager.getImage(imageName: coinID, folderName: folderName) {
            image = savedImage
//            print("Retrieved image from File Manager!")
        } else {
            downloadCoinImage()
//            print("Downloading image now")
        }
    }
    
    private func downloadCoinImage() {
        print("Downloading image now")
        guard let urlString = coin.image, !urlString.isEmpty, let url = URL(string: urlString) else {
            print("❌ Error: incorrect or empty URL")
            return
        }

        imageSubscription = NetworkingManager.download(url: url)
            .tryMap { data -> UIImage in
                guard let image = UIImage(data: data) else {
                    throw URLError(.cannotDecodeContentData)
                }
                return image
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("❌ Image loading error: \(error.localizedDescription)")
            }
        }, receiveValue: { [weak self] returnedImage in
            guard let self = self else { return }
            
            self.image = returnedImage
            self.imageSubscription?.cancel()
            
            self.fileManager.saveImage(image: returnedImage, imageName: self.imageName, folderName: self.folderName)
        })
    }
}
