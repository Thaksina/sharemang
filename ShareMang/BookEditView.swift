//
//  BookEditView.swift
//  ShareMang
//
//  Created by Thaksina on 20/5/2564 BE.
//

import SwiftUI

struct BookEditView {
    @StateObject var viewModel = BookAddViewModel()
    
    var body : some View{
        HStack{
            Section(header: Text("Book")){
                TextField("Books", text:$viewModel.book.book)
                TextField("Information", text:$viewModel.book.comment)
                
            }
        }
    }
}
