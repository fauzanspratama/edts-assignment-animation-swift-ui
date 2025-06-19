//
//  SpringExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 03/06/25.
//

import SwiftUI

// Spring Animation Example
struct SpringExample: View {
    @State private var toggle = false
    var body: some View {
        VStack(spacing: 40) {
            Image(systemName: "circle.fill")
                .font(.system(size: 50))
                .foregroundColor(Color.orange)
                .offset(x: toggle ? 100 : 0, y: 0)
        }
        .padding()
        
        Button(action: {
            // Using Response, dampingFraction, and blendDuration
            withAnimation(.spring(
                response: 0.5,
                dampingFraction: 0.4,
                blendDuration: 0)) {
                    toggle.toggle()
                }
        }) {
            Text("Animation (.spring)")
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.red)
                .cornerRadius(12)
                .foregroundColor(Color.white)
                .font(.system(size: 14, weight: .semibold))
        }
    }
}

#Preview {
    SpringExample()
}
