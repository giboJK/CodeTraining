//
//  NumberSolitaire.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/20.
//

import XCTest

/*
 A game for one player is played on a board consisting of N consecutive squares, numbered from 0 to N − 1.
 There is a number written on each square.
 A non-empty array A of N integers contains the numbers written on the squares.
 Moreover, some squares can be marked during the game.

 At the beginning of the game, there is a pebble on square number 0
 and this is the only square on the board which is marked.
 The goal of the game is to move the pebble to square number N − 1.

 During each turn we throw a six-sided die, with numbers from 1 to 6 on its faces,
 and consider the number K, which shows on the upper face after the die comes to rest.
 Then we move the pebble standing on square number I to square number I + K,
 providing that square number I + K exists. If square number I + K does not exist,
 we throw the die again until we obtain a valid move. Finally, we mark square number I + K.

 After the game finishes (when the pebble is standing on square number N − 1),
 we calculate the result. The result of the game is the sum of the numbers written on all marked squares.

 For example, given the following array:

     A[0] = 1
     A[1] = -2
     A[2] = 0
     A[3] = 9
     A[4] = -1
     A[5] = -2
 one possible game could be as follows:

 the pebble is on square number 0, which is marked;
 we throw 3; the pebble moves from square number 0 to square number 3; we mark square number 3;
 we throw 5; the pebble does not move, since there is no square number 8 on the board;
 we throw 2; the pebble moves to square number 5; we mark this square and the game ends.
 The marked squares are 0, 3 and 5, so the result of the game is 1 + 9 + (−2) = 8.
 This is the maximal possible result that can be achieved on this board.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given a non-empty array A of N integers,
 returns the maximal result that can be achieved on the board represented by array A.

 For example, given the array

     A[0] = 1
     A[1] = -2
     A[2] = 0
     A[3] = 9
     A[4] = -1
     A[5] = -2
 the function should return 8, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−10,000..10,000].
 */
class NumberSolitaire: XCTestCase {

    func test() {
        var A: [Int]
        A = [1, -2, 0, 9, -1, -2]
        XCTAssertEqual(8, solution(&A))
    }
    
    
    /*
     위 문제를 더 작은 문제의 단위로 쪼개면
     i번째 위치에서 1~6번째 앞선 인덱스까지의 합고 i번째의 합이 가장 최대가 되는 것을
     찾는 것이다.
     마지막위치에서 거꾸로 내려간다고 생각하면
     마지막 위치에서의 최대합은 마지막 위치의 1~6개 뒤의 것 중 최대값을 가지는 것 더하기 마지막이기 때문이다
     베스킨라빈스 게임이 생각났다.!
     */
    public func solution(_ A : inout [Int]) -> Int {
        var sum = [Int](repeating: Int.min, count: A.count)
        sum[0] = A[0]
        
        for i in 1 ..< A.count {
            sum[i] = A[i] + sum[i - 1]
            for j in 2 ... 6 {
                if i - j >= 0 {
                    sum[i] = max(sum[i], A[i] + sum[i - j])
                }
            }
        }
        
        return sum.last!
    }
}
