//
//  Book.swift
//  ShareMang
//
//  Created by Thaksina on 20/5/2564 BE.
//

import Foundation
import FirebaseFirestoreSwift

struct Book: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var book: String
    var comment: String
    
    enum CodingKeys: String, CodingKey {
        case book
        case comment
    }
}
