//
//  LetterBox.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct LetterBox: View {
    var letter: String
    var status: LetterStatus
    var boxColor: Color {
        switch status {
        case .changing:
            return Color(.metallicSeaweed)
        case .notChanging:
            return Color(.platinum)
        case .acceptable:
            return Color(.yellowGreenCrayola)
        case .notAcceptable:
            return Color(.rubyRed)
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .style(withStroke: Color.black, lineWidth: 1, fill: boxColor)
                .aspectRatio(1, contentMode: .fit)
            Text(String(letter))
                .font(.custom("Lovely Madness", size: 55))
                .multilineTextAlignment(.center)
        }
    }
    
}

enum LetterStatus {
    case changing
    case notChanging
    case acceptable
    case notAcceptable
}

extension Shape {
    func style<StrokeStyle: ShapeStyle, FillStyle: ShapeStyle>(
        withStroke strokeContent: StrokeStyle,
        lineWidth: CGFloat = 1,
        fill fillContent: FillStyle
    ) -> some View {
        stroke(strokeContent, lineWidth: lineWidth)
            .background(fill(fillContent))
    }
}

struct LetterBox_Previews: PreviewProvider {
    static var previews: some View {
        LetterBox(letter: .init("J"), status: .notChanging)
            .previewLayout(.fixed(width: 100, height: 100))
        LetterBox(letter: .init("A"), status: .changing)
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
