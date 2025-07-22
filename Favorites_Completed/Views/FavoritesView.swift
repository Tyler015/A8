//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: FavoritesViewModel

    var body: some View {
        NavigationStack {
            List {
                // Favorite Cities Section
                let favoriteCities = favorites.cities.filter { $0.isFavorite }
                if !favoriteCities.isEmpty {
                    Section(header: Text("Favorite Cities")) {
                        ForEach(favoriteCities) { city in
                            HStack {
                                Text(city.cityName)
                                Spacer()
                                Button(action: {
                                    favorites.toggleFavoriteCity(city: city)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                }

                // Favorite Hobbies Section
                let favoriteHobbies = favorites.hobbies.filter { $0.isFavorite }
                if !favoriteHobbies.isEmpty {
                    Section(header: Text("Favorite Hobbies")) {
                        ForEach(favoriteHobbies) { hobby in
                            HStack {
                                Text(hobby.hobbyName)
                                Spacer()
                                Button(action: {
                                    favorites.toggleFavoriteHobby(hobby: hobby)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                }

                // Favorite Books Section
                let favoriteBooks = favorites.books.filter { $0.isFavorite }
                if !favoriteBooks.isEmpty {
                    Section(header: Text("Favorite Books")) {
                        ForEach(favoriteBooks) { book in
                            VStack(alignment: .leading) {
                                Text(book.bookTitle)
                                    .font(.headline)
                                Text(book.bookAuthor)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 4)
                            .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        favorites.toggleFavoriteBook(book: book)
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                }
                                .padding(.trailing)
                            )
                        }
                    }
                }

                // No favorites fallback
                if favoriteCities.isEmpty && favoriteHobbies.isEmpty && favoriteBooks.isEmpty {
                    Text("No favorites yet!")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Your Favorites")
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
