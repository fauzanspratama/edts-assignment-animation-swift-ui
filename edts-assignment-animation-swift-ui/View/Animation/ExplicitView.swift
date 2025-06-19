//
//  ExplicitView.swift
//  edts-assignment-klik-product-detail
//
//  Created by Fauzan Sukmapratama on 11/06/25.
//

import SwiftUI

struct ExplicitView: View {
    @State private var scale: CGFloat = 0
    @State private var color: Color = .blue
    @State private var rotate: Angle = .zero
    @State private var offset: CGFloat = .zero
    @State private var isAppeared: Bool = false
    @State private var textScale: CGFloat = 1.0
    
    var body: some View {
        
        VStack {
            Text("ExplicitAnimationView")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray12)
                
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 16)
                .fill(color)
                .scaleEffect(scale)
                .frame(width: 120, height: 120)
                .rotationEffect(rotate)
                .offset(x: offset)
            
            if isAppeared {
                Text("Today is Wednesday")
                    .scaleEffect(textScale)
                    .transition(.opacity.combined(with: .scale))
                    .padding(.top, 16)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.gray12)
            }
            
            Spacer()
            
            
            Button(action: {
                withAnimation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1)) {
                    if offset == -100 {
                        offset = .zero
                    } else {
                        offset = offset == .zero ? 100 : -100
                    }
                    
                    scale = scale == 1 ? 1.2 : 1
                    color = color == .blue ? .yellow : .blue
                    rotate += .degrees(360)
                }
            }) {
                Label("Explicit Animation", systemImage: "circle.fill")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .cornerRadius(12)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .semibold))
            }
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isAppeared.toggle()
                }
                
                if isAppeared {
                    // Delay the scale animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1)) {
                            textScale = 1.5
                        }
                        
                        // Scale back to 1 after another delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1)) {
                                textScale = 1.0
                            }
                        }
                    }
                } else {
                    // Reset scale when hiding text
                    textScale = 1.0
                }
            }) {
                Label("Show Text", systemImage: "circle.fill")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .cornerRadius(12)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .semibold))
            }
        }
        .padding(16)
    }
    
}

struct ExplicitView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitView()
    }
}
