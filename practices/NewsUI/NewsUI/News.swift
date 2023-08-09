//
//  News.swift
//  NewsUI
//
//  Created by 아라 on 2023/08/08.
//

import Foundation

struct NewsResponse: Codable {
    let resultCode: Int
    let resultMsg: String
    let numOfRows, pageNo, totalCount: Int
    let items: [News]
}

// MARK: - Item
struct News: Hashable, Codable {
    let title, content: String
    let newsURLString: String
    let thumURLString: String
    let broadcastDate: String

    enum CodingKeys: String, CodingKey {
        case title, content
        case newsURLString = "news_url"
        case thumURLString = "thum_url"
        case broadcastDate = "broadcast_date"
    }
}
