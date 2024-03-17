//
//  Typography.swift
//  JobSearchApp
//
//  Created by Reek i on 15.03.2024.
//

import SwiftUI

struct Typography: ViewModifier {
    enum Style {
        case title1
        case title2
        case title3
        case title4
        case text1
        case buttonText1
        case buttonText2
        case tabText
        case number
    }

    var style: Style

    func body(content: Content) -> some View {
        switch style {
        case .title1: content.font(.system(size: 22, weight: .semibold))
        case .title2: content.font(.system(size: 20, weight: .semibold))
        case .title3: content.font(.system(size: 16, weight: .medium))
        case .title4: content.font(.system(size: 14, weight: .medium))
        case .text1: content.font(.system(size: 14, weight: .regular))
        case .buttonText1: content.font(.system(size: 16, weight: .semibold))
        case .buttonText2: content.font(.system(size: 14, weight: .regular))
        case .tabText: content.font(.system(size: 10, weight: .regular))
        case .number: content.font(.system(size: 7, weight: .regular))
        }
    }
}

extension View {
    func jType(style: Typography.Style, color: Color) -> some View {
        modifier(Typography(style: style))
            .foregroundStyle(color)
    }
}
