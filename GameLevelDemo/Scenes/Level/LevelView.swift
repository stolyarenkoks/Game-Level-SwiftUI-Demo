//
//  LevelView.swift
//  GameLevelDemo
//
//  Created by Konstantin Stolyarenko on 04.09.2023.
//  Copyright © 2023 SKS. All rights reserved.
//

import SwiftUI

// MARK: - LevelView

struct LevelView: View {

    // MARK: - Constants

    fileprivate enum Constants {
        static let borderWidth: CGFloat = 8.0
        static let cornerRadius: CGFloat = 20.0
        static let horizontalPadding: CGFloat = 16.0
        static let inBetweenPadding: CGFloat = 16.0

        static let titleViewHeight: CGFloat = 60.0
        static let titleViewShadowOffset: CGFloat = 15.0
        static let scrollViewShadowOffset: CGFloat = 25.0
    }

    // MARK: - Internal Properties

    let title: String
    let dataSource: [Section: [LevelStepModel]]

    // MARK: - Body

    var body: some View {
        VStack(spacing: Constants.inBetweenPadding) {
            titleView()

            scrollView()
        }
    }

    // MARK: - Private Methods

    private func titleView() -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("border-yellow"))
                .frame(height: Constants.titleViewHeight)
                .cornerRadius(Constants.cornerRadius)

            Text(title)
                .frame(maxWidth: .infinity, maxHeight: Constants.titleViewHeight)
                .font(.title)
                .bold()
                .foregroundColor(Color("foreground-yellow"))
                .background(Color("background-yellow"))
                .cornerRadius(Constants.cornerRadius)
                .padding(.bottom, Constants.titleViewShadowOffset)
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.top, Constants.inBetweenPadding)
    }

    private func scrollView() -> some View {
        ScrollView(.horizontal) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("border-brown"))

                VStack(alignment: .leading, spacing: .zero) {
                    ForEach(Section.allCases, id: \.self) { section in
                        if let steps = dataSource[section] {
                            HStack(spacing: .zero) {
                                ForEach(steps, id: \.self) { step in
                                    LevelStepCell(step: step)
                                }
                            }
                        }
                    }
                }
                .padding(Constants.borderWidth - 1)
                .cornerRadius(Constants.cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .inset(by: Constants.borderWidth / 2)
                        .stroke(Color(dataSource[.first]?.first?.borderColorName ?? ""),
                                lineWidth: Constants.borderWidth)
                )
                .padding(.bottom, Constants.scrollViewShadowOffset)
            }
            .cornerRadius(Constants.cornerRadius)
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.bottom, 8.0)
        }
        .padding(.bottom, Constants.inBetweenPadding)
    }
}

// MARK: - PreviewProvider

struct LevelView_Previews: PreviewProvider {

    static var previews: some View {
        LevelView(title: LevelStore().title(forLevel: .green),
                  dataSource: LevelStore().dataSource(forLevel: .green))
        .previewDisplayName("Green Level")

        LevelView(title: LevelStore().title(forLevel: .purple),
                  dataSource: LevelStore().dataSource(forLevel: .purple))
        .previewDisplayName("Purple Level")
    }
}
