//
//  TimerService.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

protocol TimerService {

  var delegate: TimerServiceDelegate? { get set }
  var isRunning: Bool { get }

  func start(fromSeconds seconds: Int)
  func add(seconds: Int)
  func stop()
}

protocol TimerServiceDelegate {

  func remaining(seconds: Int)
}
