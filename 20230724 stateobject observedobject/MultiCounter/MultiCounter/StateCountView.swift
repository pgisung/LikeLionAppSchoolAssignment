//
//  StateCountView.swift
//  MultiCounter
//
//  Created by Jongwook Park on 2023/07/19.
//

import SwiftUI

struct StateCountView: View {
    @StateObject var countStore = CountStore()
    
    var body: some View {
        HStack {
            Text("\(countStore.count)")
                .padding()
            
            Button {
                countStore.count += 1
            } label: {
                Text("+1 State")
            }

        }
        .padding()
        .font(.largeTitle)
    }
}

struct StateCountView_Previews: PreviewProvider {
    static var previews: some View {
        StateCountView()
    }
}
