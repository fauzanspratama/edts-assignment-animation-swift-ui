//
//  InterpolatingSpringExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 03/06/25.
//

import SwiftUI

// Interpolating spring example
struct InterpolatingSpringExample: View {
    @State private var toggle = false
    var body: some View {
        VStack(spacing: 40) {
            Circle()
                .fill(Color.orange)
                .frame(width: 60, height: 60)
                .offset(x: toggle ? 100 : 0, y: 0)
        }
        .padding()
        
        Button("Animate (.interpolatingSpring)") {
            // Using Stiffness and Damping Parameters
            withAnimation(.interpolatingSpring(
                mass: 5,
                stiffness: 80,
                damping: 20,
                initialVelocity: 10)) {
                toggle.toggle()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.red)
        .cornerRadius(12)
        .foregroundColor(Color.white)
        .font(.system(size: 14, weight: .semibold))
    }
}


#Preview {
    InterpolatingSpringExample()
}
