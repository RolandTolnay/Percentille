//
//  RandomInt.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

public struct RandomInt {

  public let rule: DigitRule
  public let divisors: [Int]

  public init(rule: DigitRule, divisors: [Int]) {

    self.divisors = divisors
    self.rule = rule
  }

  public init(_ rule: DigitRule, _ divisors: [Int]) {

    self.init(rule: rule, divisors: divisors)
  }

  public func make() -> Int {

    switch rule {
    case .upTo:
      return Int.random(upToDigits: rule.digits, divisibleByEither: divisors)
    case .strict:
      return Int.random(strictDigits: rule.digits, divisibleByEither: divisors)
    case .overflowing:
      return Int.random(overflowingDigits: rule.digits, divisibleByEither: divisors)
    }
  }
}

extension RandomInt {

  public enum DigitRule {

    case upTo(digits: Int)
    case strict(digits: Int)
    case overflowing(digits: Int)

    public var digits: Int {
      switch self {
      case .upTo(let digits),
           .overflowing(let digits),
           .strict(let digits):
        return digits
      }
    }
  }
}
