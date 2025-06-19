//
//  InteractiveSpringExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 03/06/25.
//

import SwiftUI

struct InteractiveSpringExample: View {
    @State private var isBounce: Bool = false
    @State private var offsetY: CGFloat = 0
    
    
    var body: some View {
        VStack {
            Text(".interactiveSpring Animation")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray12)
            
            Spacer()
            
            Circle()
                .fill(Color.orange)
                .frame(width: 120, height: 120)
                .offset(x: 0, y: offsetY)
            
            Spacer()
            
            Button(action: {
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.75, blendDuration: 0)) {
                        
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
                Text("Animate (.interactiveSpring)")
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
    InteractiveSpringExample()
}
