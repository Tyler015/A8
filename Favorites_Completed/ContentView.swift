//
// ContentView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

enum TabSelections {
    case home
    case favorites
    case settings
}

struct ContentView: View {
    @StateObject private var favorites = FavoritesViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
        .environmentObject(favorites)
    }
    
}
#Preview {
    ContentView()
        .environmentObject(FavoritesViewModel())
}
