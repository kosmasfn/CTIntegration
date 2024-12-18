//
//  ItemProductView.swift
//  cttest
//
//  Created by Kosmas Ndruru on 15/03/24.
//

import SwiftUI

struct ItemProductView: View {
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        LazyVGrid(columns: adaptiveColumn, spacing: 20) {
            Image(uiImage: #imageLiteral(resourceName: "cakex.jpeg"))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(10)
                .cornerRadius(40)
            List(content: {
                Text("Cake").foregroundColor(.black)
                Text("Cake").foregroundColor(.black)
                Text("Cake").foregroundColor(.black)
                Text("Cake").foregroundColor(.black)
            })
        }.background(
            Color.black.opacity(0.1)
            .ignoresSafeArea()
        )
    }
}

#Preview {
    ItemProductView()
}
