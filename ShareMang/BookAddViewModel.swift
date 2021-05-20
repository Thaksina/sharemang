//
//  BookAddViewModel.swift
//  ShareMang
//
//  Created by Thaksina on 20/5/2564 BE.
//

import Foundation
import Firebase

class BookAddViewModel: ObservableObject{
    @Published var book: Book = Book(book: "", comment:"")
    private var db = Firestore.firestore()

    func addBook(_ book:Book){
        do{
            let _ = try db.collection("books").addDocument(from: book)

        }
        catch{
            print(error)

        }
        
    }
    func save() {
        addBook(book)
    }
}

