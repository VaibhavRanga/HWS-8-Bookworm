//
//  AddBookView.swift
//  HWS-8-Bookworm
//
//  Created by Vaibhav Ranga on 06/06/24.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 0
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    @State private var showingEmptyFieldsAlert = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                Section("Review the book") {
                    VStack(spacing: 10) {
                        TextField("Write review", text: $review, axis: .vertical)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.gray.opacity(0.2))
                        
                        RatingView(rating: $rating)
                    }
                }
                
                Section {
                    Button("Save") {
                        if isFormInvalid() {
                            showingEmptyFieldsAlert = true
                        } else {
                            let book = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)
                            modelContext.insert(book)
                            
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Add Book")
            .alert("Enter the required details", isPresented: $showingEmptyFieldsAlert) {
                Button("Ok") {}
            }
        }
    }
    
    func isFormInvalid() -> Bool {
        if title.isEmpty || author.isEmpty || review.isEmpty || rating == 0 {
            return true
        }
        return false
    }
}

#Preview {
    AddBookView()
}
