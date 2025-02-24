//
//  SearchBarView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 07.03.2025.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.theme.accent)
                        .offset(x: 10)
                        .padding()
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    
                    
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 10, x: 0.0, y: 0.0)
            )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)  // Превью для светлой темы
            
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)   // Превью для тёмной темы
        }
    }
}
