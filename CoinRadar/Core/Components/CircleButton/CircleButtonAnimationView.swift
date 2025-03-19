//
//  CircleButtonAnimationView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 26.02.2025.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @State private var animateCircle: Bool = false

    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animateCircle ? 1.0 : 0.0)
            .opacity(animateCircle ? 0.0 : 1.0)
            .animation(.easeOut(duration: 1.0), value: animateCircle)
            .onAppear {
                // При первом появлении вью анимируем
                animateCircle = true
            }
    }
}

#Preview {
    CircleButtonAnimationView()
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
}
