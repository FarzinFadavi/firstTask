//
//  SineWave.swift
//  firstTask
//
//  Created by Farzin macbook on 1/16/24.
//

import Foundation
import SwiftUI

struct SineWave: Shape {
    let startRadians = -CGFloat.pi / 2
    let endRadians = 3 * CGFloat.pi / 2
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let midHeight = height / 2
        let amplitude = height / 3
        let scale = width / (endRadians - startRadians)
        
        var path = Path()
        for x in stride(from: 0, through: width, by: 1) {
            let radians = startRadians + CGFloat(x) / scale
            let y = -amplitude * sin(radians) + midHeight
            if x == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}
