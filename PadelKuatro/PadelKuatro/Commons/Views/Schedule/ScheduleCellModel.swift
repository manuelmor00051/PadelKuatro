//
//  ScheduleCellModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 28/3/24.
//

import Foundation

struct ScheduleCellModel {
    let scheduleType: ScheduleType
    let user: String
    let time: String

    init(scheduleType: ScheduleType, user: String, time: String) {
        self.scheduleType = scheduleType
        self.user = user
        self.time = time
    }
}
