import SwiftUI

struct ShapeTransformAnimation: View {
    @State private var isCircle = true
    @State private var animateLoop = false
    @Namespace private var shapeTransition
    
    var body: some View {
        VStack(spacing: 80) {
            // Shape transformation area
            ZStack {
                if isCircle {
                    Circle()
                        .fill(Color.blue.gradient)
                        .frame(width: 120, height: 120)
                        .matchedGeometryEffect(id: "shape", in: shapeTransition)
                } else {
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color.purple.gradient)
                        .frame(width: 160, height: 160)
                        .matchedGeometryEffect(id: "shape", in: shapeTransition)
                }
            }
            .scaleEffect(animateLoop ? 1.2 : 1.0)
            .rotationEffect(.degrees(animateLoop ? 360 : 0))
            .animation(Animation.timingCurve(0.42, 0, 0.58, 1, duration: 2).repeatForever(autoreverses: true), value: animateLoop)
            .onAppear {
                animateLoop = true
            }
            
            // Controls
            VStack(spacing: 20) {
                Button("Transform Shape") {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.6, blendDuration: 0)) {
                        isCircle.toggle()
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color.orange.gradient)
                .cornerRadius(16)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
            }
        }
        .padding(32)
    }
}

#Preview {
    ShapeTransformAnimation()
}
