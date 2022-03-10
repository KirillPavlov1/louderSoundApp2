//
//  louderSoundApp2App.swift
//  louderSoundApp2
//
//  Created by Кирилл on 10.03.2022.
//

import SwiftUI

@main
struct louderSoundApp2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
