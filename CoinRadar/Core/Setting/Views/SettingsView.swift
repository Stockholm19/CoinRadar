//
//  SettingsView.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 22.03.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isPresented: Bool
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/@klotze")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/klotze")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/Stockholm19")!
    let messageURL = URL(string: "https://t.me/klotze")!
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background layer
                Color.theme.background
                    .ignoresSafeArea()
                
                // content layer
                List {
                    appInfoSection
                        .listRowBackground(Color.theme.cardBackground)
                    coinGeckoSection
                        .listRowBackground(Color.theme.cardBackground)
                    developerSection
                        .listRowBackground(Color.theme.cardBackground)
                    applicationSection
                        .listRowBackground(Color.theme.cardBackground)
                }
                .scrollContentBackground(.hidden)
                .background(Color.theme.background)
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(isPresented: $isPresented)
                }
            }
        }
    }
}

#Preview {
    SettingsView(isPresented: .constant(true))
}

extension SettingsView {
    
    private var appInfoSection: some View {
        Section(header: Text("CoinTracker")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("The application uses MVVM Architecture, CoreData and Combine framework to fetch data from CoinGecko API.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Code project on GitHub 🚀", destination: personalURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("The cryptocurrency data that is used in this app comes from a free API from. CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("dev-logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("This app was developed by Roman Pshenichnikov. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistanse.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Message me in Telegram 👻", destination: messageURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("CoinGecko")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
            
        }
    }
    
    private func Link(_ title: String, destination: URL) -> some View {
        SwiftUI.Link(title, destination: destination)
            .font(.headline)
            .foregroundColor(Color.blue)
    }
}
