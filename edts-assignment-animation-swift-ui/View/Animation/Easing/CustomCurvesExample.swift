//
//  CustomCurvesExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 04/06/25.
//
import SwiftUI

struct CustomCurvesExample: View {
    @State private var scale = 1.0
    
    var body: some View {
        VStack {
            Circle()
                .foregroundStyle(Color.orange)
                .scaleEffect(scale)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: scale)
            
            Button("Custom Curves Animate") {
                if scale == 1.0 {
                    scale = 0.25
                } else {
                    scale = 1.0
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.red)
            .cornerRadius(12)
            .foregroundColor(Color.white)
            .font(.system(size: 14, weight: .semibold))
        }
        .padding(16)
    }
}

#Preview {
    CustomCurvesExample()
}
