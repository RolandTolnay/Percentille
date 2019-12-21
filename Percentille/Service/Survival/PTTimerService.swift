//
//  PTTimerService.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

class PTTimerService: TimerService {

  var delegate: TimerServiceDelegate?

  var isRunning: Bool {

    guard let timer = timer else { return false }
    return timer.isValid
  }

  private var timer: Timer?
  private var remaining: Int = 0 {
    didSet {
      delegate?.remaining(seconds: remaining)
    }
  }

  func start(fromSeconds seconds: Int) {

    remaining = seconds
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: onTimerTick)
  }

  func add(seconds: Int) {

    remaining += seconds
  }

  func stop() {

    timer?.invalidate()
    timer = nil
    remaining = 0
  }

  private func onTimerTick(timer: Timer) {

    remaining -= 1
    if remaining == 0 {
      stop()
    }
  }
}
