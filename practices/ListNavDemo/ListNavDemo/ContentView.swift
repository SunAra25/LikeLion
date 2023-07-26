//
//  ContentView.swift
//  ListNavDemo
//
//  Created by 아라 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var carStroe: CarStroe = CarStroe(cars: carData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(carStroe.cars) { car in
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationTitle("EV Cars")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        AddNewCar(carStore: self.carStroe)
                    } label: {
                        Text("Add")
                    }

                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteItems(at offets: IndexSet) {
        carStroe.cars.remove(atOffsets: offets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStroe.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        NavigationLink(destination: CarDetail(selectedCar: car)) {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
                    .bold()
            }
        }
    }
}
