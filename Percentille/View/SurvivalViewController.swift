//
//  SurvivalViewController.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import UIKit

class SurvivalViewController: UIViewController {

  @IBOutlet weak var problemLabel: UILabel!
  @IBOutlet weak var answerTextField: UITextField!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var timerLabel: UILabel!
  
  private var service: SurvivalService = PTSurvivalService(timerService: PTTimerService())

  override func viewDidLoad() {
    super.viewDidLoad()

    setupInput()
    service.delegate = self

    problemLabel.text = "\(service.nextProblem())"
    answerTextField.becomeFirstResponder()
  }

  @objc func onAnswerInput() {

    guard let answer = Double(answerTextField.text ?? "") else { return }
    answerTextField.text = ""

    let _ = service.validateAnswer(answer)
    problemLabel.text = "\(service.nextProblem())"
  }

  private func setupInput() {

    let tap = UITapGestureRecognizer(target: self, action: #selector(onAnswerInput))
    view.addGestureRecognizer(tap)
  }
}

extension SurvivalViewController: SurvivalServiceDelegate {

  func updated(score: Int) {

    DispatchQueue.main.async {
      self.scoreLabel.text = "Score: \(score)"
    }
  }

  func remaining(seconds: Int) {

    let time = seconds.time
    DispatchQueue.main.async {
      self.timerLabel.text = String(format: "%02i : %02i", time.minutes, time.seconds)
    }
  }

  func finished(score: Int, correctAnswersPercent: Double) {

    // TODO: Show alert
  }
}

