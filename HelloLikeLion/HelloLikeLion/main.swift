//
//  main.swift
//  HelloLikeLion
//
//  Created by JOHNNY_MAC_1 on 2023/05/26.
//

import Foundation

//print("Hello, Like Lion!")

// ---------------------------- 각 함수별 실행시간 측정
func exampleA () {
    var arr = [1,1,2,3,1]

    //1번
    if arr.suffix(4) == [1,2,3,1] {
        
    }
}

func exampleB () {
    var arr = [1,1,2,3,1]
    //2번
    let suffix = arr.suffix(4)
    if suffix == [1,2,3,1] {

    }
}

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return (diff)
}

print(progressTime {
    print(exampleA())
})
print(progressTime {
    print(exampleB())
})

// ---------------------------- 배열 중복제거
extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

var arr = [1, 1, 2, 3, 3, 4, 5, 7, 6]
for iLoopCount in 0..<arr.count {
    if iLoopCount == arr.count - 1 {
        print("\(arr[iLoopCount])", terminator: "\n")
    } else {
        print("\(arr[iLoopCount]) ", terminator: "")
    }
}
arr = arr.uniqued()
for iLoopCount in 0..<arr.count {
    if iLoopCount == arr.count - 1 {
        print("\(arr[iLoopCount])", terminator: "\n")
    } else {
        print("\(arr[iLoopCount]) ", terminator: "")
    }
}
