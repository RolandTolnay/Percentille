//
//  PTSurvivalService.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

class PTSurvivalService: SurvivalService {

  var delegate: SurvivalServiceDelegate?

  private typealias Progress = (level: Int, problem: Int)

  private static let baseDurationSeconds = 90
  private static let problemsPerLevel = 3
  private static let secondsPerCorrectAnswer = 5

  private var progress: Progress = (0, 0)
  private var problem: Problem? = nil
  private var score: Int = 0 {
    didSet {
      delegate?.updated(score: score)
    }
  }

  private var timerService: TimerService

  init(timerService: TimerService) {

    self.timerService = timerService
    self.timerService.delegate = self
  }

  func nextProblem() -> Problem {

    if !timerService.isRunning {
      timerService.start(fromSeconds: PTSurvivalService.baseDurationSeconds)
    }
    let currentLevel = progress.level
    var problem = JourneyMode.problemMakers[currentLevel].make()
    while problem == self.problem {
      problem = JourneyMode.problemMakers[currentLevel].make()
    }
    self.problem = problem

    return problem
  }

  func validateAnswer(_ answer: Double) -> AnswerValidation {

    guard let problem = problem
      else { fatalError("No problem where expected") }

    if answer == problem.answer {
      increaseProgress()
      timerService.add(seconds: PTSurvivalService.secondsPerCorrectAnswer)
      score += 1
      return .correct
    } else {
      return .wrong(expected: problem.answer)
    }
  }

  private func increaseProgress() {

    progress.problem += 1
    if progress.problem == PTSurvivalService.problemsPerLevel {
      progress.level += 1
      progress.problem = 0
    }
  }
}

extension PTSurvivalService: TimerServiceDelegate {

  func remaining(seconds: Int) {

    delegate?.remaining(seconds: seconds)
    if seconds == 0 {
      score = 0
      progress = (0, 0)
    }
  }
}
