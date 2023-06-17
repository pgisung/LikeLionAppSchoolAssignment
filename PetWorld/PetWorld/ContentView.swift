//
//  ContentView.swift
//  PetWorld
//
//  Created by Jongwook Park on 2023/06/14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var titleMessage: String = "친구를 선택해주세요"
    @State var titleImageName: String = ""
    
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Label("Pets", systemImage: "pawprint.circle.fill")
                .font(.largeTitle)
            
            // 위 라벨은 이렇게 HStack으로 만들어도 된다
    /*
            HStack {
                Image(systemName: "teddybear.fill")
                Text("Pets")
            }
            .font(.largeTitle)
     */
            
            List(pets) { pet in
                Button {
                    sayPet(pet)
                } label: {
                    VStack {
                        Image("\(pet.imageName)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 350)
                            .clipped()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(pet.name)")
                                    .font(.largeTitle)
                                Text("\(pet.kind)")
                            }
                            Spacer()
                            Text("\(pet.friendName)")
                        }
                        .padding()
                    }
                }
            }
            .listStyle(.plain)
            
            HStack {
                Image("\(titleImageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipped()
                
                Text("\(titleMessage)")
                Spacer()
                Button("랜덤선택") {
                    let pet: Pet = pets.randomElement()!
                    sayPet(pet)
                }
            }
            .padding()
            
        }
    }
    
    func sayPet(_ pet: Pet) {
        
        var message: String = "\(pet.friendName)와 함께하는 \(pet.name)은 "
        
        switch pet.kind {
        case "멍멍이":
            message += "멍멍"
        case "야옹이":
            message += "야옹야옹"
        default:
            break
        }
        
        titleMessage = message
        titleImageName = pet.imageName
        
        let utterance = AVSpeechUtterance(string: message)
        speechSynth.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
