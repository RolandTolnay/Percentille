//
//  Int+time.swift
//  Percentille
//
//  Created by Roland Tolnay on 26/12/2018.
//  Copyright © 2018 iQuest Technologies. All rights reserved.
//

import Foundation

typealias Time = (minutes: Int, seconds: Int)

extension Int {

  var time: Time {

    return (minutes: self / 60 % 60, seconds: self % 60)
  }
}
