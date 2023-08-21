//
//  CarView.swift
//  ListNavDemo
//
//  Created by JOHNNY_MAC_1 on 2023/07/25.
//

import SwiftUI

struct CarView: View {
    @EnvironmentObject var carStore: CarStore
    
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(carStore.cars){ car in
                    ListCellView(car: car)
                }
                .onDelete(perform: carStore.deleteItems)
                .onMove(perform: carStore.moveItems)
            }
            .navigationBarTitle(Text("EV Cars"))
            .navigationBarItems(trailing: EditButton())
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Add") {
                        isPresented = true
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                CarAddNewView(isPresented: $isPresented)
            }
        }
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView()
            .environmentObject(CarStore(cars: CarManager.getManager.carData))
    }
}

struct ListCellView: View {
    var car: Car
    
    var body: some View {
        NavigationLink(destination: CarDetailView(selectedCar: car)){
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}
