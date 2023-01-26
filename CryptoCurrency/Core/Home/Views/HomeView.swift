//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by Steve Pha on 1/26/23.
// source : https://www.youtube.com/watch?v=-QT_bEx-4zg

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                //top movers view
                TopMoversView(viewModel: viewModel)
                
                Divider()
                
                //all coins view
                AllCoinsView(viewModel: viewModel)
            }
            .navigationBarTitle("Live Prices")
        }//end nav
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
