//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by 아라 on 2023/07/25.
//

import SwiftUI

struct AddNewCar: View {
    @ObservedObject var carStore: CarStroe
    @State var isHybrid = false
    @State var name: String = ""
    @State var description: String = ""
    //@Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid")
                        .font(.headline)
                }
                .padding()
            }
            
            Button("Add Car") {
                addNewCar()
                //dismiss()
            }
        }
    }
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        
        carStore.cars.append(newCar)
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar(carStore: CarStroe(cars: carData))
    }
}
