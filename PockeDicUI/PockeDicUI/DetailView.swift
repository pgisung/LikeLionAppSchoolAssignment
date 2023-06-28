//
//  DetailView.swift
//  PockeDicUI
//
//  Created by JOHNNY_MAC_1 on 2023/06/27.
//

import SwiftUI

struct DetailView: View {
    var pockemon: String // 초기화될 내용은 호출하시는 분이 알려주실거임
    
    var power: Int {
        switch pockemon {
        case "잠만보", "파이리", "꼬부기", "마자용", "메타몽":
            return 10
        case "야도란", "피죤투","뮤", "레쿠쟈":
            return 20
        case "리자몽", "큐레무", "뮤츠", "찌리리공", "치코리타", "푸린":
            return 30
        default:
            return 40
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(pockemon)을 선택하셨습니다")
            Spacer()
            Text("\(pockemon)의 능력치는 \(power)입니다")
            Spacer()
            Button(action: {
                        guard let url = URL(string: "https://www.apple.com") else { return }
                        UIApplication.shared.open(url)
                    }) {
                        Text("Open Safari")
                    }
        }
        .font(.largeTitle)
        .navigationTitle("\(pockemon)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(pockemon: "고라파덕")
        }
    }
}
