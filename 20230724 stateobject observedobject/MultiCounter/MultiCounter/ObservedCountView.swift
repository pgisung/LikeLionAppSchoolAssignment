//
//  ObservedCountView.swift
//  MultiCounter
//
//  Created by Jongwook Park on 2023/07/19.
//

import SwiftUI

struct ObservedCountView: View {
    @ObservedObject var countStore = CountStore()
    
    var body: some View {
        HStack {
            Text("\(countStore.count)")
                .padding()
            
            Button {
                countStore.count += 1
            } label: {
                Text("+1 Observed")
            }

        }
        .padding()
        .font(.largeTitle)
    }
}

struct ObservedCountView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedCountView()
    }
}
