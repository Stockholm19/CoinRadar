//
//  XMarkButton.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 10.03.2025.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.headline)
            })
        }
}

#Preview {
    XMarkButton()
}
