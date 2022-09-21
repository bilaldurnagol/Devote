//
//  DevoteApp.swift
//  Devote
//
//  Created by Bilal Durnagöl on 19.09.2022.
//

import SwiftUI

@main
struct DevoteApp: App {
    
    // MARK: - PROPERTY
    
    let persistenceController = PersistenceController.shared
    @AppStorage("isDarkMode") private var isDarkModel: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkModel ? .dark : .light)
        }
    }
}
