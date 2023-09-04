//
//  LevelStepCell.swift
//  GameLevelDemo
//
//  Created by Konstantin Stolyarenko on 29.08.2023.
//

import SwiftUI

// MARK: - LevelStepCell

struct LevelStepCell: View {

    // MARK: - Internal Properties

    var step: LevelStepModel

    // MARK: - Body

    var body: some View {
        ZStack {
            roadView()

            HStack(spacing: 0.0) {
                Image("player-image")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(1.1, contentMode: .fit)
                    .opacity(step.showPlayer ? 1.0 : 0.0)

                Image(step.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, 4.0)

                Image("start_line")
                    .resizable()
                    .scaledToFit()
                    .opacity(step.showStartLine ? 1.0 : 0.0)
            }
        }
        .background(Color(step.backgroundColorName))
        .aspectRatio(1.0, contentMode: .fit)
    }

    // MARK: - Private Methods

    private func roadView() -> some View {
        ZStack {
            if let roadDirection = step.roadDirection {
                HStack {
                    roadViewHorizontalPart(isAvailable: roadDirection.contains(.left))
                    roadViewHorizontalPart(isAvailable: roadDirection.contains(.right))
                }

                VStack {
                    roadViewVerticalPart(isAvailable: roadDirection.contains(.top))
                    roadViewVerticalPart(isAvailable: roadDirection.contains(.bottom))
                }
            }
        }
    }

    private func roadViewHorizontalPart(isAvailable: Bool) -> some View {
        Rectangle()
            .frame(height: 20)
            .foregroundColor(isAvailable ? .white : .clear)
            .opacity(0.5)
    }

    private func roadViewVerticalPart(isAvailable: Bool) -> some View {
        Rectangle()
            .frame(width: 20)
            .foregroundColor(isAvailable ? .white : .clear)
            .opacity(0.5)
            .padding(.leading, 2)
    }
}

// MARK: - PreviewProvider

struct LevelStepCell_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            HStack {
                Text("roadDirection: .top")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.top]))
            }

            HStack {
                Text("roadDirection: .bottom")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.bottom]))
            }

            HStack {
                Text("roadDirection: .left")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.left]))
            }

            HStack {
                Text("roadDirection: .right")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.right]))
            }
        }
        .padding(.vertical, 8.0)
        .padding(.horizontal, 16.0)
        .previewDisplayName("Single Road Direction")

        // C(n:k) = n!/(n−k)!⋅k! -> C(4:2) = 4!/(4-2)!⋅2! = 24/4 = 6
        VStack {
            HStack {
                Text("roadDirection: .left and .right")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.left, .right]))
            }

            HStack {
                Text("roadDirection: .left and .top")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.left, .top]))
            }

            HStack {
                Text("roadDirection: .left and .bottom")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.left, .bottom]))
            }

            HStack {
                Text("roadDirection: .top and .bottom")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.top, .bottom]))
            }

            HStack {
                Text("roadDirection: .top and .right")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.top, .right]))
            }

            HStack {
                Text("roadDirection: .bottom and .right")
                Spacer()
                LevelStepCell(step: .init(stepType: .exercise, stepState: .inactive, roadDirection: [.bottom, .right]))
            }
        }
        .padding(.vertical, 8.0)
        .padding(.horizontal, 16.0)
        .previewDisplayName("Multiple Road Direction")
    }
}
