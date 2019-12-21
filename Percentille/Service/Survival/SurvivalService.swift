//
//  SurvivalService.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

enum AnswerValidation {

  case correct
  case wrong(expected: Double)
}

protocol SurvivalService {

  var delegate: SurvivalServiceDelegate? { get set }

  func nextProblem() -> Problem
  func validateAnswer(_ answer: Double) -> AnswerValidation
}

protocol SurvivalServiceDelegate {

  func updated(score: Int)
  func remaining(seconds: Int)
  func finished(score: Int, correctAnswersPercent: Double)
}
