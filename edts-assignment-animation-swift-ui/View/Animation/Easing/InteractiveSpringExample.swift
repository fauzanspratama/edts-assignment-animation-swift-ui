//
//  InteractiveSpringExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 03/06/25.
//

import SwiftUI

// Interactive spring example
struct InteractiveSpringExample: View {
    @State private var toggle = false
    var body: some View {
        VStack(spacing: 40) {
            Capsule()
                .fill(Color.orange)
                .frame(width: 50, height: 50)
                .offset(x: toggle ? 100 : 0, y: 0)
        }
        .padding()
        
        Button("Animate (.interactiveSpring)") {
            // Using Response, dampingFraction, and blendDuration
            withAnimation(.interactiveSpring(
                response: 0.3,
                dampingFraction: 0.6,
                blendDuration: 0)) {
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
    InteractiveSpringExample()
}
