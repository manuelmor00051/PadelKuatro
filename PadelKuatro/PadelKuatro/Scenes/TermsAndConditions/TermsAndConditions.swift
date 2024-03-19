//
//  TermsAndConditions.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 19/3/24.
//

import SwiftUI

enum TermsType {
    case accept
    case read
}

struct TermsAndConditions: View {

    var termsType: TermsType = .accept
    @Binding var termsAccepted: Bool
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text("terms_and_conditions_description")
                    if termsType == .accept {
                        Button {
                            termsAccepted = true
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("terms_and_conditions_accept")
                        }
                        .buttonStyle(RoundedButton(color: Constants.Colors.purpleButton))
                    }
                }
                .padding()
            }
        }
    }
}
