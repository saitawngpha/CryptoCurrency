//
//  HomeViewModel.swift
//  CryptoCurrency
//
//  Created by Steve Pha on 1/26/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var topMovieCoins = [Coin]()
    
    init() {
        fetchCoinData()
    }
    
    
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response code \(response.statusCode)")
            }
            
            guard let data = data else {return}
//            let dataString = String(data: data, encoding: .utf8)
//            print("DEBUG: Data \(data)")
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configuerTopMovingCoins()
                    print("DEBUG: coins \(coins)")
                }
            }catch let error{
                print("DEBUB: Failed to decode with error: \(error )")
            }
            
        }.resume()
        
    }
    
    func configuerTopMovingCoins() {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovieCoins = Array(topMovers.prefix(10))
    }
    
}
