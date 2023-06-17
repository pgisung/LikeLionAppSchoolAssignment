//
//  ContentView.swift
//  memberUI
//
//  Created by JOHNNY_MAC_1 on 2023/06/14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var objSpeechSynthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    @State var message: String = "Select a grade"
//    @State var message: String = "Select a member"
    
    var body: some View {
        VStack {
            Text(message)
            
            List(grades) { grade in
                Button {
                    message = doGugudan(grade.grade)

                    let objSpeechUtterance = AVSpeechUtterance(string: message)
                    objSpeechSynthesizer.speak(objSpeechUtterance)
                } label: {
                    HStack {
                        Text("\(grade.grade)단")
                            .foregroundColor(.blue)
                    }
                }
            }
            
//            List(members) { member in
//                Button {
//                    message = "Hello \(member.strName) #\(member.strNickName)"
//
//                    let objSpeechUtterance = AVSpeechUtterance(string: message)
//                    objSpeechSynthesizer.speak(objSpeechUtterance)
//                } label: {
//                    HStack {
//                        Image("\(member.imageName)")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                        Text("\(member.strName)")
//                        Spacer()
//                        Text("\(member.strNickName)")
//                            .foregroundColor(.blue)
//                    }
//                }
//            }
        }
        .font(.largeTitle)
        .listStyle(.plain)
    }
    
    func doGugudan(_ grade: Int) -> String {
        var strReturn: String = ""
        message = ""
        
        for iLoopCount in 1...9 {
            strReturn += "\(grade) x \(iLoopCount) = \(grade * iLoopCount)\n"
        }
        
        return strReturn
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
