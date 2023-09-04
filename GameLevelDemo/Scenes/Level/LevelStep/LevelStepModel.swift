//
//  LevelStepModel.swift
//  GameLevelDemo
//
//  Created by Konstantin Stolyarenko on 29.08.2023.
//

import Foundation

// MARK: - LevelStepModel

struct LevelStepModel: Hashable {

    // MARK: - RoadDirection Enum

    enum RoadDirection: String {
        case top
        case bottom
        case left
        case right
    }

    // MARK: - StepType Enum

    enum StepType: String {
        case book
        case exercise
        case game
        case story
        case video
    }

    // MARK: - StepState Enum

    enum StepState: String {
        case inactive
        case active
        case finished
    }

    // MARK: - Internal Properties

    let id: UUID = UUID()
    var levelType: LevelType = .green
    var showPlayer: Bool = false
    var showStartLine: Bool = false
    var stepType: StepType?
    var stepState: StepState?
    var roadDirection: [RoadDirection]?

    var imageName: String {
        guard let stepType = stepType, let stepState = stepState else {
            return imagePlaceholderName
        }
        return "\(stepType.rawValue)_token_\(stepState.rawValue)"
    }

    var imagePlaceholderName: String {
        "placeholder-\(levelType.rawValue)-\(Int.random(in: 1...3))"
    }

    var backgroundColorName: String {
        "background-\(levelType.rawValue)-\(Int.random(in: 1...5))"
    }

    var borderColorName: String {
        "border-\(levelType.rawValue)"
    }
}
