//
//  ConditionalAnimation.swift
//  edts-assignment-animation-swift-ui
//
//  Created by Fauzan Sukmapratama on 19/06/25.
//

import SwiftUI

struct ConditionalAnimation: View {
    @State private var counter = 0
    @State private var animationDirection: AnimationDirection = .none
    
    let transitionAnimation: Animation = .spring(response: 0.4, dampingFraction: 0.8)
    
    var body: some View {
        VStack {
            Text("Conditional Animation")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray12)
            
            Spacer()
            
            ZStack {
                Text("\(counter)")
                    .font(.system(size: 80, weight: .bold))
                    .id(counter)
                    .transition(.asymmetric(
                        insertion: .move(edge: animationDirection == .up ? .bottom : .top).combined(with: .opacity),
                        removal: .move(edge: animationDirection == .up ? .top : .bottom).combined(with: .opacity)
                    ))
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                Button(action: {
                    animationDirection = .down
                    
                    withAnimation(transitionAnimation) {
                        counter -= 1
                    }
                }) {
                    Label("Mins", systemImage: "minus")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
                .background(Color.red.gradient)
                .cornerRadius(10)
                
                Button(action: {
                    animationDirection = .up
                    
                    withAnimation(transitionAnimation) {
                        counter += 1
                    }
                    
                }) {
                    Label("Plus", systemImage: "plus")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue.gradient)
                .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

enum AnimationDirection {
    case up // For incrementing (plus)
    case down // For decrementing (minus)
    case none // Initial or no specific direction
}

struct ConditionalAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalAnimation()
    }
}
