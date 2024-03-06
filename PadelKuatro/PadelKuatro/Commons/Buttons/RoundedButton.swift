//
//  RoundedButton.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 3/3/24.
//

import SwiftUI

struct RoundedButton: ButtonStyle {

    var color: Color = .white

    init(color: Color) {
        self.color = color
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .controlSize(.large)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(width: 300)
    }
}
