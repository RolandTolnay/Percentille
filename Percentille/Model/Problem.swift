//
//  Problem.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

public struct Problem: Equatable {

  public let percentage: Int
  public let number: Int

  public var answer: Double {
    return Double(percentage * number) / Double(100)
  }

  public init(percentage: Int, number: Int) {

    self.percentage = percentage
    self.number = number
  }
}

extension Problem: CustomStringConvertible {

  public var description: String {
    return "\(percentage)% of \(number)"
  }
}
