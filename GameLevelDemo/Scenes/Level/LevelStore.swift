//
//  LevelStore.swift
//  GameLevelDemo
//
//  Created by Konstantin Stolyarenko on 29.08.2023.
//

import Foundation

// MARK: - Section Enum

enum Section: Int, CaseIterable {
    case first, second, third
}

// MARK: - LevelType Enum

enum LevelType: String {
    case green
    case purple
}

// MARK: - LevelStore

struct LevelStore {

    // MARK: - Private Properties

    /// Should be fetched from the Server, not planned to be hardcoded in the app, just for Demo purposes.
    private let greenLevelDataSource: [Section: [LevelStepModel]] = [
        .first: [
            .init(showStartLine: true, stepType: .story, stepState: .finished, roadDirection: [.right]),
            .init(stepType: .exercise, stepState: .finished, roadDirection: [.left, .right]),
            .init(stepType: .exercise, stepState: .finished, roadDirection: [.left, .right]),
            .init(stepType: .book, stepState: .finished, roadDirection: [.left, .right]),
            .init(stepType: .game, stepState: .finished, roadDirection: [.left, .right]),
            .init(stepType: .story, stepState: .finished, roadDirection: [.left, .right]),
            .init(stepType: .video, stepState: .finished, roadDirection: [.left, .right]),
            .init(stepType: .exercise, stepState: .finished, roadDirection: [.left, .bottom]),
        ],

        .second: [
            .init(stepType: .story, stepState: .inactive, roadDirection: [.bottom, .right]),
            .init(stepType: .exercise, stepState: .inactive, roadDirection: [.left, .right]),
            .init(stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(stepType: .exercise, stepState: .inactive, roadDirection: [.left, .right]),
            .init(stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(stepType: .exercise, stepState: .inactive, roadDirection: [.left, .right]),
            .init(showPlayer: true, stepType: .story, stepState: .active, roadDirection: [.left, .right]),
            .init(stepType: .game, stepState: .finished, roadDirection: [.top, .left])
        ],

        .third: [
            .init(stepType: .exercise, stepState: .inactive, roadDirection: [.top, .right]),
            .init(stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(stepType: .exercise, stepState: .inactive, roadDirection: [.left]),
            .init(),
            .init(),
            .init(),
            .init(),
            .init()
        ]
    ]

    /// Should be fetched from the Server, not planned to be hardcoded in the app, just for Demo purposes.
    private let purpleLevelDataSource: [Section: [LevelStepModel]] = [
        .first: [
            .init(levelType: .purple, showStartLine: true, stepType: .story, stepState: .inactive, roadDirection: [.right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .bottom]),
        ],

        .second: [
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.bottom, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .exercise, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.top, .left])
        ],

        .third: [
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.top, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left, .right]),
            .init(levelType: .purple, stepType: .story, stepState: .inactive, roadDirection: [.left]),
            .init(levelType: .purple),
            .init(levelType: .purple),
            .init(levelType: .purple)
        ]
    ]

    // MARK: - Internal Methods

    func title(forLevel level: LevelType) -> String {
        switch level {
        case .green:
            return Const.Level.greenLevelTitle
        case .purple:
            return Const.Level.purpleLevelTitle
        }
    }

    func dataSource(forLevel level: LevelType) -> [Section: [LevelStepModel]] {
        switch level {
        case .green:
            return greenLevelDataSource
        case .purple:
            return purpleLevelDataSource
        }
    }
}
