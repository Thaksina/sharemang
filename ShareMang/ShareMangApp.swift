//
//  ShareMangApp.swift
//  ShareMang
//
//  Created by Thaksina on 18/5/2564 BE.
//

import SwiftUI
import Firebase

struct ShareMangApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
