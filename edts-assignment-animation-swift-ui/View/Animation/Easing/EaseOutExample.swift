//
//  EaseOutExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 03/06/25.
//

import SwiftUI


// Ease-Out animation example
struct EaseOutExample: View {
    @State private var toggle = false
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange)
                .frame(width: 80, height: 120)
                .offset(x: toggle ? 100 : 0, y: 0)
        }
        .padding()
        
        Button("Animate (.easeOut)") {
            withAnimation(.easeOut(duration: 1.0)) {
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
    EaseOutExample()
}
