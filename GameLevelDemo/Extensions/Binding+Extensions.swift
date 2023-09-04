//
//  Binding+Extensions.swift
//  GameLevelDemo
//
//  Created by Konstantin Stolyarenko on 04.09.2023.
//  Copyright © 2023 SKS. All rights reserved.
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
