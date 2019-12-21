//
//  JourneyMode.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

struct JourneyMode {

  static let problemMakers: [ProblemMaker] = [

    // MARK: - Digits: 2
    // MARK: - Whole answers
    // MARK: Percentage divisors: 25

    ProblemMaker(type: .whole, // 1
      percentageDivisors: [25],
      number: RandomInt(.strict(digits: 2), [20])),
    ProblemMaker(type: .whole, // 2
      percentageDivisors: [25],
      number: RandomInt(.strict(digits: 2), [10])),

    // MARK: Percentage divisors: 25, 20

    ProblemMaker(type: .whole, // 3
      percentageDivisors: [25, 20],
      number: RandomInt(.strict(digits: 2), [10])),
    ProblemMaker(type: .whole, // 4
      percentageDivisors: [25, 20],
      number: RandomInt(.strict(digits: 2), [4, 5, 10])),
    ProblemMaker(type: .whole, // 5
      percentageDivisors: [25, 20],
      number: RandomInt(.strict(digits: 2), [2, 3, 5])),

    // MARK: Percentage divisors: 25, 10

    ProblemMaker(type: .whole, // 6
      percentageDivisors: [25, 10],
      number: RandomInt(.strict(digits: 2), [10])),
    ProblemMaker(type: .whole, // 7
      percentageDivisors: [25, 10],
      number: RandomInt(.strict(digits: 2), [4, 5, 10])),
    ProblemMaker(type: .whole, // 8
      percentageDivisors: [25, 10],
      number: RandomInt(.strict(digits: 2), [2, 3, 5])),

    // MARK: Percentage divisors: 5

    ProblemMaker(type: .whole, // 9
      percentageDivisors: [5],
      number: RandomInt(.strict(digits: 2), [10])),
    ProblemMaker(type: .whole, // 10
      percentageDivisors: [5],
      number: RandomInt(.strict(digits: 2), [2, 3, 5])),

    // MARK: - Decimal answers
    // MARK: Percentage divisors: 25, 20

    ProblemMaker(type: .decimal, // 11
      percentageDivisors: [25, 20],
      number: RandomInt(.strict(digits: 2), [10])),
    ProblemMaker(type: .decimal, // 12
      percentageDivisors: [25, 20],
      number: RandomInt(.strict(digits: 2), [4, 5, 10])),
    ProblemMaker(type: .decimal, // 13
      percentageDivisors: [25, 20],
      number: RandomInt(.strict(digits: 2), [2, 3, 5])),

    // MARK: Percentage divisors: 25, 10

    ProblemMaker(type: .decimal, // 14
      percentageDivisors: [25, 10],
      number: RandomInt(.strict(digits: 2), [4, 5, 10])),
    ProblemMaker(type: .decimal, // 15
      percentageDivisors: [25, 10],
      number: RandomInt(.strict(digits: 2), [2, 3, 5])),

    // MARK: Percentage divisors: 5

    ProblemMaker(type: .decimal, // 16
      percentageDivisors: [5],
      number: RandomInt(.strict(digits: 2), [10])),
    ProblemMaker(type: .decimal, // 17
      percentageDivisors: [5],
      number: RandomInt(.strict(digits: 2), [2, 3, 5])),

    // MARK: Percentage divisors: 2, 5

    ProblemMaker(type: .decimal, // 18
      percentageDivisors: [2, 5],
      number: RandomInt(.strict(digits: 2), [10])),
    ProblemMaker(type: .decimal, // 19
      percentageDivisors: [2, 5],
      number: RandomInt(.strict(digits: 2), [5, 10])),
    ProblemMaker(type: .decimal, // 20
      percentageDivisors: [2, 5],
      number: RandomInt(.strict(digits: 2), [2, 3, 5])),

    // MARK: - Digits: 3
    // MARK: - Whole answers
    // MARK: Percentage divisors: 25

    ProblemMaker(type: .whole, // 21
      percentageDivisors: [25],
      number: RandomInt(.strict(digits: 3), [50])),
    ProblemMaker(type: .whole, // 22
      percentageDivisors: [25],
      number: RandomInt(.strict(digits: 3), [20])),
    ProblemMaker(type: .whole, // 23
      percentageDivisors: [25],
      number: RandomInt(.upTo(digits: 3), [10])),

    // MARK: Percentage divisors: 25, 20

    ProblemMaker(type: .whole, // 24
      percentageDivisors: [25, 20],
      number: RandomInt(.upTo(digits: 3), [50])),
    ProblemMaker(type: .whole, // 25
      percentageDivisors: [25, 20],
      number: RandomInt(.upTo(digits: 3), [10])),

    // MARK: Percentage divisors: 25, 10

    ProblemMaker(type: .whole, // 6
      percentageDivisors: [25, 10],
      number: RandomInt(.upTo(digits: 3), [50])),
    ProblemMaker(type: .whole, // 7
      percentageDivisors: [25, 10],
      number: RandomInt(.upTo(digits: 3), [10])),

    ]
}
