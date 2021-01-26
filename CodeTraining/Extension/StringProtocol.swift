//
//  StringProtocol.swift
//  CodeTraining
//
//  Created by 정김기보 on 2021/01/26.
//

//https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language/38215613#38215613
import Foundation
extension StringProtocol {
    subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
    subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
    subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
    subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

extension BidirectionalCollection {
    subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}

/* Testing
     let test = "Hello USA 🇺🇸!!! Hello Brazil 🇧🇷!!!"
     test[safe: 10]   // "🇺🇸"
     test[11]   // "!"
     test[10...]   // "🇺🇸!!! Hello Brazil 🇧🇷!!!"
     test[10..<12]   // "🇺🇸!"
     test[10...12]   // "🇺🇸!!"
     test[...10]   // "Hello USA 🇺🇸"
     test[..<10]   // "Hello USA "
     test.first   // "H"
     test.last    // "!"

     // Subscripting the Substring
      test[...][...3]  // "Hell"

     // Note that they all return a Substring of the original String.
     // To create a new String from a substring
     test[10...].string  // "🇺🇸!!! Hello Brazil 🇧🇷!!!"
 */
