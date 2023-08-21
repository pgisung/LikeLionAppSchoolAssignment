//
//  DataInputView.swift
//  ListNavDemo
//
//  Created by JOHNNY_MAC_1 on 2023/07/25.
//

import SwiftUI

struct DataInputView: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct DataInputView_Previews: PreviewProvider {
    static var previews: some View {
        DataInputView(title: "Hello world", userInput: .constant("Hello world"))
    }
}
