//
//  BooksView.swift
//  Favorites_Completed
//
//  Created by user277244 on 7/10/25.
//

import SwiftUI

struct BooksView: View {
    @EnvironmentObject private var favorites: FavoritesViewModel
    @Binding var searchText: String

    var filteredBooks: [BookModel] {
        if searchText.isEmpty {
            return favorites.books
        } else {
            return favorites.books.filter {
                $0.bookTitle.localizedCaseInsensitiveContains(searchText) ||
                $0.bookAuthor.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        List(filteredBooks) { book in
            HStack {
                VStack(alignment: .leading) {
                    Text(book.bookTitle)
                        .font(.headline)
                    Text(book.bookAuthor)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button {
                    favorites.toggleFavoriteBook(book: book)
                } label: {
                    Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .padding(.vertical, 4)
        }
        .listStyle(.plain)
    }
}
