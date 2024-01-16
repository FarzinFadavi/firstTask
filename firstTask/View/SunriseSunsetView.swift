//
//  sunRiseSunRiseView.swift
//  firstTask
//
//  Created by Farzin macbook on 1/15/24.
//

import SwiftUI

struct SunriseSunsetView: View {
    
    @State private var phase: CGFloat = 0.1
    let sineWave = SineWave()
    
    var body: some View {
        VStack {
            ZStack {
                
                Color(red: 28 / 255.0, green: 26 / 255.0, blue: 31 / 255.0)
                    .cornerRadius(15)
                
                VStack {
                    
                    SineWave()
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 0.5, dash: [3, 3]))
                        .frame(height: 100)
                        .padding(.horizontal, 23)
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                
                ZStack {
                    
                    AnimatableSineWave(phase: phase)
                        .stroke(Color.indigo.opacity(0.7), lineWidth: 3)
                        .modifier(SunPathAnimationModifier(phase: phase, path: sineWave.path(in: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 80, height: 100))))
                        .frame(height: 100)
                        .padding(.horizontal, 23)
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                
                HStack {
                    
                    SunEventView(event: .sunrise, time: "8:10 am", isSunrise: true)
                    
                    Spacer()
                    
                    SunEventView(event: .sunset, time: "4:02 pm", isSunrise: false)
                    
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .shadow(radius: 10)
            .padding(.horizontal,16)
            
            Text("Animate")
                .padding(.top,50)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 3)) {
                        phase = 0.75
                    }
                }
        }
    }
}

#Preview {
    SunriseSunsetView()
}









