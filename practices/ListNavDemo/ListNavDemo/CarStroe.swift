//
//  CarStroe.swift
//  ListNavDemo
//
//  Created by 아라 on 2023/07/25.
//

import SwiftUI
import Combine

class CarStroe: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
