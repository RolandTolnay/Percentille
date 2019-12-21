//
//  Int+random.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

public extension Int {

  static func random(upToDigits: Int, divisibleBy divisible: Int) -> Int {

    let upper = 10.powered(by: upToDigits) / divisible
    return Int.random(in: 1..<upper) * divisible
  }

  static func random(strictDigits: Int, divisibleBy divisible: Int) -> Int {

    let lower = Swift.max((10.powered(by: strictDigits - 1) / divisible), 1)
    let upper = 10.powered(by: strictDigits) / divisible
    return Int.random(in: lower..<upper) * divisible
  }

  static func random(overflowingDigits: Int, divisibleBy divisible: Int) -> Int {

    let upper = 10.powered(by: overflowingDigits) / divisible
    return Int.random(in: 1...upper) * divisible
  }

  // MARK: -

  static func random(upToDigits: Int, divisibleByEither divisibles: [Int]) -> Int {

    guard let random = divisibles
      .map({ Int.random(upToDigits: upToDigits, divisibleBy: $0) })
      .randomElement()
      else { return Int.random(in: 1..<(10.powered(by: upToDigits))) }
    return random
  }

  static func random(strictDigits: Int, divisibleByEither divisibles: [Int]) -> Int {

    guard let random = divisibles
      .map({ Int.random(strictDigits: strictDigits, divisibleBy: $0) })
      .randomElement()
      else { return Int.random(in: (10.powered(by: strictDigits))..<(10.powered(by: strictDigits))) }
    return random
  }

  static func random(overflowingDigits: Int, divisibleByEither divisibles: [Int]) -> Int {

    guard let random = divisibles
      .map({ Int.random(overflowingDigits: overflowingDigits, divisibleBy: $0) })
      .randomElement()
      else { return Int.random(in: 1...(10.powered(by: overflowingDigits))) }
    return random
  }

  // MARK: -

  func powered(by value: Int) -> Int {
    return Int(pow(Double(self),Double(value)))
  }
}

