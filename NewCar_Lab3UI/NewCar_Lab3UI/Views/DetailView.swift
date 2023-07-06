//
//  DetailView.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import SwiftUI

struct DetailView: View {
    let dataStruct: any Car
    
    var body: some View {
        Form {
            Section {
                
                AsyncImage(url: dataStruct.imagePathURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                
            }
            Section("상세내용") {
                Text("모델 네임: \(dataStruct.modelName)")
                Text("브랜드: \(dataStruct.brand)")
                Text("색상: \(dataStruct.color)")

            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dataStruct: jiSungDreamCar)
    }
}
