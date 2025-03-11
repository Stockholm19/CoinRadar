//
//  XMarkButton.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 10.03.2025.
//

import SwiftUI

struct XMarkButton: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button(action: {
            isPresented = false
        }) {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
        }
    }
}

#Preview {
    XMarkButton(isPresented: .constant(false))
}
