//
//  BooksViewModel.swift
//  ShareMang
//
//  Created by Thaksina on 20/5/2564 BE.
//

import Foundation
import FirebaseFirestore
class BooksViewModel: ObservableObject {
    @Published var books = [Book]()
    
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("books").addSnapshotListener{ (querySnapshot,error) in
            guard let documents = querySnapshot?.documents else{
                print("No document")
                return
            }
            self.books = documents.map { (queryDocumentSnapshot) -> Book in
                let data = queryDocumentSnapshot.data()
                
                let book = data["book"] as? String ?? ""
                let comment = data["comment"] as? String ?? ""
                
                let blockbook = Book(book: book, comment: comment)
                return blockbook
            }
        
        }
    }
    
}
