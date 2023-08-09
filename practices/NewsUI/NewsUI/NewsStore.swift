//
//  NewsStore.swift
//  NewsUI
//
//  Created by 아라 on 2023/08/08.
//

import Foundation

class NewsStore: ObservableObject {
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        let apiKey = "x20U4Ik8EwF1xaFwygNjFGmFVWrIQ1nUkMq3fngP4ap7esAaYd%2FkSXM6ulBEoyOahKYdyTZO9dyjH%2BBr9Zdi8Q%3D%3D"
        let urlString = "https://apis.data.go.kr/B551024/openArirangNewsApi/news?pageNo=10&numOfRows=10&serviceKey=x20U4Ik8EwF1xaFwygNjFGmFVWrIQ1nUkMq3fngP4ap7esAaYd%2FkSXM6ulBEoyOahKYdyTZO9dyjH%2BBr9Zdi8Q%3D%3D"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
