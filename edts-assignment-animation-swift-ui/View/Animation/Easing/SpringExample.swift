//
//  SpringExample.swift
//  Declarative Sandbox
//
//  Created by Shidiq Bagus Ardi Prastian on 03/06/25.
//

import SwiftUI

struct SpringExample: View {
    @State private var isBounce = false
    @State private var offsetY: CGFloat = 0
    
    
    var body: some View {
        VStack {
            Text(".spring Animation")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray12)
            
            Spacer()
            
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(Color.orange)
                .offset(x: 0, y: offsetY)
            
            Spacer()
            
            Button(action: {
                // Using Response, dampingFraction, and blendDuration
                withAnimation(.spring(
                    response: 0.5,
                    dampingFraction: 0.75,
                    blendDuration: 0)) {
                        
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
                Text("Animation (.spring)")
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
    SpringExample()
}
