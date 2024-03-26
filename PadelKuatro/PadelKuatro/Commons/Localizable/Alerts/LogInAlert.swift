//
//  LogInAlert.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 26/3/24.
//

import SwiftUI

enum LogInAlertType {
    case wrongEmail
    case wrongSignUp
    case notMatchPassword
    case wronLogIn
    case emptyEmailOrPassword
    case successSingUp
}

class ShowAlert {
    func show(alert: LogInAlertType, completion: @escaping () -> Void) -> Alert {
        switch alert {
        case .wrongEmail:
            return Alert(title: Text("Error"), message: Text("Introduce un email válido"), dismissButton: .default(Text("Aceptar")))
        case .wrongSignUp:
            return Alert(title: Text("Error"), message: Text("Error al registrar el usuario"), dismissButton: .default(Text("Aceptar")))
        case .notMatchPassword:
            return Alert(title: Text("Error"), message: Text("Las contraseñas deben coincidir y tener un tamaño mayor a \(Constants.Defaults.passwordLength) caracteres"), dismissButton: .default(Text("Aceptar")))
        case .wronLogIn:
            return Alert(title: Text("Error"), message: Text("No se puede acceder al usuario"), dismissButton: .default(Text("Aceptar")))
        case .emptyEmailOrPassword:
            return Alert(title: Text("Error"), message: Text("Rellene los campos de email y contraseña"), dismissButton: .default(Text("Aceptar")))
        case .successSingUp:
            return Alert(title: Text(""), message: Text("Usuario creado correctamente"), dismissButton: .default(Text("Aceptar"), action: completion))
        }
    }
}
