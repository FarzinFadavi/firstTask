//
//  SunPathAnimationModifier.swift
//  firstTask
//
//  Created by Farzin macbook on 1/16/24.
//

import Foundation
import SwiftUI

struct SunPathAnimationModifier: AnimatableModifier {
    var phase: CGFloat
    let path: Path
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    let point = calculateSunPosition(at: phase, in: geometry.size)
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.yellow)
                        .position(x: point.x , y: point.y )
                }
            )
    }
    
    private func calculateSunPosition(at phase: CGFloat, in size: CGSize) -> CGPoint {
        let trimmedPath = path.trimmedPath(from: 0, to: phase)
        return trimmedPath.currentPoint ?? CGPoint(x: 0, y: size.height / 2)
    }
}
