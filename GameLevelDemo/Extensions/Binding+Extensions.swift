//
//  Binding+Extensions.swift
//  GameLevelDemo
//
//  Created by Konstantin Stolyarenko on 30.08.2023.
//

import SwiftUI

// MARK: - Binding Extension

extension Binding {

    func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
            closure()
        })
    }
}
