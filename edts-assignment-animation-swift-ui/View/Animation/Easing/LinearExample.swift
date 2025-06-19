//
//  LinearExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 03/06/25.
//

import SwiftUI

// Linear Animation Example
struct LinearExample: View {
    @State private var toggle = false
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange)
                .frame(width: 80, height: 80)
                .offset(x: toggle ? 100 : 0, y: 0)
        }
        .padding()
        
        Button("Animate (.linear)") {
            withAnimation(.linear(duration: 1.0)) {
                toggle.toggle()
            }
        }
    }
}

#Preview {
    LinearExample()
}
