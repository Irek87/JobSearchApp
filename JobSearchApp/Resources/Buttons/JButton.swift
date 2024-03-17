//
//  JButton.swift
//  JobSearchApp
//
//  Created by Reek i on 16.03.2024.
//

import SwiftUI

struct JButton: View {
    enum Style {
        case blueBig, blueSmall, green
    }

    private let title: String
    private let style: JButton.Style
    private let action: () -> Void

    init(
        title: String,
        style: JButton.Style,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            switch style {
            case .blueBig:
                Text(title)
                    .jType(style: .buttonText1, color: .jWhite)
                    .multilineTextAlignment(.center)
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.jBlue)
                    )
            case .blueSmall:
                Text(title)
                    .jType(style: .buttonText2, color: .jWhite)
                    .multilineTextAlignment(.center)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.jBlue)
                    )
            case .green:
                Text(title)
                    .jType(style: .buttonText2, color: .jWhite)
                    .multilineTextAlignment(.center)
                    .frame(height: 32)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.jGreen)
                    )
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 16) {
        JButton(title: "Blue Big", style: .blueBig, action: {})
        JButton(title: "Blue small", style: .blueSmall, action: {})
        JButton(title: "Green", style: .green, action: {})
    }
}
