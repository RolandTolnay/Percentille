//
//  ProblemMaker.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

public struct ProblemMaker {

  private let percentage: RandomInt
  private let number: RandomInt
  private let answerType: AnswerType

  public init(type: AnswerType,
              percentageDivisors: [Int],
              number: RandomInt) {

    self.number = number
    self.answerType = type
    percentage = RandomInt(rule: .overflowing(digits: 2), divisors: percentageDivisors)
  }

  public func make() -> Problem {

    let percentage = self.percentage.make()
    var problem = Problem(percentage: percentage, number: number.make())

    switch answerType {
    case .whole:
      // TODO: Look into optimizing this
      while (!problem.answer.isWhole) {
        problem = Problem(percentage: percentage, number: number.make())
      }
      return problem
    default:
      return problem
    }
  }
}

extension ProblemMaker {

  public enum AnswerType {

    case whole
    case decimal
  }
}

extension Double {

  public var isWhole: Bool {
    return floor(self) == self
  }
}
