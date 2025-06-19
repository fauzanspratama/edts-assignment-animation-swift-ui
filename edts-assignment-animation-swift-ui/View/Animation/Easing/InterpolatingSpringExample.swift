//
//  InterpolatingSpringExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 03/06/25.
//

import SwiftUI

struct InterpolatingSpring: View {
    @State private var isBounce = false
    @State private var offsetY: CGFloat = 0
    
    var body: some View {
        VStack {
            Text(".interpolatingSpring Animation")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray12)
            
            Spacer()
            
            Circle()
                .fill(Color.orange.gradient)
                .frame(width: 120, height: 120)
                .offset(x: 0, y: offsetY)
            
            Spacer()
            
            Button(action: {
                withAnimation(.interpolatingSpring(
                    mass: 1,
                        stiffness: 100,
                        damping: 15,
                        initialVelocity: 0)) {
                        
                        isBounce.toggle()
                        
                        if offsetY == 0 {
                            offsetY = -200
                        } else if offsetY == -200 {
                            offsetY = 200
                        } else {
                            offsetY = 0
                        }
                    }
            }) {
                Text("Animate (.interpolatingSpring)")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .cornerRadius(12)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .semibold))
            }
        }
        .padding()
    }
}

#Preview {
    InterpolatingSpring()
}
