//
//  CarData.swift
//  ListNavDemo
//
//  Created by 아라 on 2023/07/25.
//

import UIKit
import SwiftUI

var carData: [Car] = loadJson("carData.json")

// 애플의 Json 파일 읽어오는 형식
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    // Json -> Car 타입으로 변환을 시도
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
