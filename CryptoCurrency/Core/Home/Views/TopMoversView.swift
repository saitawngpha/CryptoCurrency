//
//  TopMoversView.swift
//  CryptoCurrency
//
//  Created by Steve Pha on 1/26/23.
//

import SwiftUI

struct TopMoversView: View {
    
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal){
                HStack(spacing: 16){
                    ForEach(viewModel.topMovieCoins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }//end hstack
            }//scrollview
        }//end vStack
        .padding()
    }
}

//struct TopMoversView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversView()
//    }
//}
