//
//  BookListView.swift
//  ShareMang
//
//  Created by Thaksina on 20/5/2564 BE.
//

import SwiftUI

struct BookListView : View {
    @ObservedObject private var viewModel = BooksViewModel()
    
    var body: some View{
        HStack{
            List(viewModel.books){
                book in VStack(alignment: .leading){
                    Text(book.book)
                        .font(.headline)
                    Text(book.comment)
                        .font(.headline)
                }
            }
            .onAppear(){
                self.viewModel.fetchData()
            }
        }
    }
}
