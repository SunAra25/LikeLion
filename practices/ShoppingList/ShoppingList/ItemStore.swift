//
//  ShoppingItemStore.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import Foundation

class ItemStore: ObservableObject {
    @Published var shoppingItems: [ShoppingItem] = []
    
    init() {
        shoppingItems = [
            ShoppingItem(name: "삼성전자 갤럭시 Z 플립5 5G 자급제 SM-F731N", imageUrlString: "https://images.samsung.com/kdp/event/sec/2023/0801_galaxy_flip5/preorder/buying/slide/flip5_buying_default01_pc.png", price: 1289000, shoppingName: "Coupang", shoppingUrlString: "https://www.coupang.com/vp/products/7410157624?itemId=19197972081&vendorItemId=86315402641&q=%ED%95%B8%EB%93%9C%ED%8F%B0&itemsCount=36&searchId=cc5372605ae348519b0819e0682c0bf0&rank=0&isAddedCart="),
            ShoppingItem(name: "에어팟 맥스", imageUrlString: "https://images.samsung.com/kdp/event/sec/2023/0801_galaxy_flip5/preorder/buying/slide/flip5_buying_default01_pc.png", price: 769000, shoppingName: "Apple", shoppingUrlString: "https://www.apple.com/kr/shop/buy-airpods/airpods-max"),
            ShoppingItem(name: "Mac Studio", imageUrlString: "https://www.apple.com/v/mac-studio/f/images/overview/hero/static_front__fmvxob6uyxiu_large.jpg", price: 2990000, shoppingName: "Apple", shoppingUrlString: "https://www.apple.com/kr/mac-studio/")
        ]
    }
}

