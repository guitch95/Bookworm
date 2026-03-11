//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Guillaume Richard on 03/03/2026.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
