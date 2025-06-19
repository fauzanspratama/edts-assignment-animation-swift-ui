//
//  ImplicitView.swift
//  edts-assignment-klik-product-detail
//
//  Created by Fauzan Sukmapratama on 11/06/25.
//

import SwiftUI

struct ImplicitView: View {
    @State private var scale: CGFloat = 1
    @State private var color: Color = .blue
    @State private var rotate: Angle = .zero
    @State private var offset: CGFloat = .zero
    @State private var cornerRadius: CGFloat = 16
    @State private var frameWidth: CGFloat = 120
    @State private var frameHeight: CGFloat = 120
    @State private var lineWidth: CGFloat = 0
    @State private var isTransformed = false
    @State private var isOutlined = false
    
    var body: some View {
        
        VStack {
            Text("ImplicitView Animation")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray12)
            
            Spacer()
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(color)
                .stroke(Color.cyan.gradient, lineWidth: lineWidth)
                .frame(width: frameWidth, height: frameHeight)
                .scaleEffect(scale)
                .rotationEffect(rotate)
                .blur(radius: isTransformed ? 2 : 0)
                .opacity(isTransformed ? 0.95 : 1)
                .offset(x: offset)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: scale)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: color)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: rotate)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: offset)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: cornerRadius)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: frameWidth)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: frameHeight)
                .animation(Animation.timingCurve(1, -0.4, 0.35, 0.95, duration: 1), value: lineWidth)
            
            
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false)  {
                HStack {
                    // Scale Button Animation
                    Button(action: {
                        scale = scale == 1 ? 2 : 1
                    }) {
                        Label("Scale", systemImage: "arrow.up.left.and.arrow.down.right")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.red)
                            .cornerRadius(12)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
                    // Change Color Button Animation
                    Button(action: {
                        color = color == .blue ? .yellow : .blue
                    }) {
                        Label("Change Color", systemImage: "circle")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.red)
                            .cornerRadius(12)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
                    // Rotation Button Animation
                    Button(action: {
                        rotate += .degrees(360)
                    }) {
                        Label("Rotate Me", systemImage: "arrow.clockwise")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.red)
                            .cornerRadius(12)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
                    // Change Position Button Animation
                    Button(action: {
                        if offset == -100 {
                            offset = .zero
                        } else {
                            offset = offset == .zero ? 100 : -100
                        }
                    }) {
                        Label("Change Position", systemImage: "arrow.left.arrow.right")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.red)
                            .cornerRadius(12)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
                    // Transform Shape Animation
                    Button(action: {
                        isTransformed.toggle()
                        cornerRadius = isTransformed ? 8 : 16
                        frameWidth = isTransformed ? 320 : 120
                        frameHeight = isTransformed ? 240 : 120
                    }) {
                        Label("Transform Shape", systemImage: "rectangle")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.red)
                            .cornerRadius(12)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
                    // Outline Shape Animation
                    Button(action: {
                        isOutlined.toggle()
                        lineWidth = isOutlined ? 8 : 0
                        scale = scale == 1 ? 1.5 : 1
                    }) {
                        Label("Outline Shape", systemImage: "rectangle")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.red)
                            .cornerRadius(12)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ImplicitView_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitView()
    }
}
