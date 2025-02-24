//
//  ContentView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 24.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40.0) {
                
                Text("Accent Color")
                    .foregroundStyle(Color.theme.accent)
            
                Text("Secondary Text Color")
                    .foregroundStyle(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundStyle(Color.red)
                
                Text("Green Color")
                    .foregroundStyle(Color.green)
            }
            .font(.headline)
        }
    }
}


#Preview {
    ContentView()
}
