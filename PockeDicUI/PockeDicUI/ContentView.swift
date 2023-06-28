//
//  ContentView.swift
//  PockeDicUI
//
//  Created by JOHNNY_MAC_1 on 2023/06/27.
//

import SwiftUI

struct ContentView: View {
    
    let pockemons: [String] = [
        "잠만보",
        "파이리",
        "꼬부기",
        "마자용",
        "메타몽",
        "야도란",
        "피죤투",
        "뮤",
        "레쿠쟈",
        "리자몽",
        "큐레무",
        "뮤츠",
        "찌리리공",
        "치코리타",
        "푸린",
        "토게피",
        "썬더",
        "피츄",
        "이브이",
        "홍수몬",
        "펄기아",
        "기라티나",
        "냐옹이",
        "이상해씨",
        "아르세우스",
        "가이오가",
        "야도란",
        "이상해풀",
        "근육몬",
        "별가사리",
        "고디탱",
        "고라파덕",
        "갸라도스",
        "잉어킹",
        "야돈",
        "거북왕",
        "내루미",
    ]
    
    var body: some View {
        NavigationStack {
            List(pockemons, id: \.self) { pockemon in
                
                NavigationLink {
                    // destination
                    DetailView(pockemon: pockemon)
                    
                } label: {
                    // label
                    Text("\(pockemon)")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pockemons")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
