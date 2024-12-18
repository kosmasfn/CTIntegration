//
//  FoodView.swift
//  cttest
//
//  Created by Kosmas Ndruru on 15/03/24.
//

import SwiftUI

struct FoodView: View{
    
    private var data  = Array(1...20)
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    ItemProductView()
                }
            }
            
        }.onAppear(){
            CTevent.onFoodPageVisited()
        }
    }
}

#Preview {
    FoodView()
}
