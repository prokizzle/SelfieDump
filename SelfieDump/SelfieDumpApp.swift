//
//  SelfieDumpApp.swift
//  SelfieDump
//
//  Created by Nick Prokesch on 8/3/22.
//

import SwiftUI

@main
struct SelfieDumpApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
