//
//  SunEventView.swift
//  firstTask
//
//  Created by Farzin macbook on 1/16/24.
//

import Foundation
import SwiftUI

struct SunEventView: View {
    var event: SunEvent
    var time: String
    var isSunrise: Bool

    var body: some View {
        HStack {
            if isSunrise {
                Image(systemName: "sunrise")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.indigo)
                    .frame(width: 25, height: 25)
            }

            VStack(spacing: 0) {
                Text(event.rawValue)
                    .foregroundStyle(.gray)
                    .font(.system(size: 12, weight: .regular, design: .default))

                Text(time)
                    .foregroundStyle(.white)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
            }
            .padding(isSunrise ? .leading : .trailing, 5)

            if !isSunrise {
                Image(systemName: "sunset")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.indigo)
                    .frame(width: 25, height: 25)
            }
        }
        .padding(.bottom, 20)
        .padding(isSunrise ? .leading : .trailing, 15)
    }
}

enum SunEvent: String {
    case sunrise = "Sunrise"
    case sunset = "Sunset"
}
