//
//  ButtonView.swift
//  ClosureCalcUI
//
//  Created by Jongwook Park on 2023/06/29.
//

import SwiftUI

struct ButtonView: View {
    let buttonString: String
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(buttonString)")
            Spacer()
        }
        .padding()
        .padding()
        .foregroundColor(.white)
        .background(Color.gray)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonString: "BUTTON")
    }
}
