//
//  ScheduleCell.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 28/3/24.
//

import SwiftUI

enum ScheduleType {
    case free
    case reserved
    case tournament
    case vacations
}

struct ScheduleCell: View {

    let model: ScheduleCellModel

    var body: some View {
        ZStack {
            Rectangle()
                .fill(getColor(model.scheduleType))
            VStack {
                switch model.scheduleType {
                case .free:
                    Text(model.time)
                case .reserved:
                    Text(model.time)
                    Text(model.user)
                case .tournament:
                    Text(model.time)
                    Text("schedule_tournamet")
                case .vacations:
                    Text(model.time)
                    Text("schedule_vacations")
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ScheduleCell(model: ScheduleCellModel(scheduleType: .reserved, user: "Manuel Moreno Cámara", time: "10:30 - 12:00"))
}

extension ScheduleCell {

    private func getColor(_ scheduleType: ScheduleType) -> Color {
        switch scheduleType {
        case .free:
            Color.green.opacity(0.8)
        case .reserved:
            Color.red.opacity(0.8)
        case .tournament:
            Color.brown
        case .vacations:
            Color.gray
        }
    }
}
