//
//  ShoppingItemDetailView.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import SwiftUI

struct ItemView: View {
    var shoppingItem: Item
    
    var body: some View {
        HStack {
            AsyncImage(url: shoppingItem.imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            .border(.gray)
            VStack(alignment: .leading) {
                Text("\(shoppingItem.shoppingName)")
                    .font(.title2)
                    .padding(.bottom, 5)
                Text("\(shoppingItem.name)")
                    
                HStack {
                    Spacer()
                    Text("\(shoppingItem.price)")
                }
                .padding()
            }
        }
    }
}

struct ShoppingItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(shoppingItem: ItemStore().shoppingItems[0])
    }
}
