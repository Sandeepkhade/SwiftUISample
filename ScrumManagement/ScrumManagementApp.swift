//
//  ScrumManagementApp.swift
//  ScrumManagement
//
//  Created by Sandeep Khade on 24/10/23.
//

import SwiftUI

@main
struct ScrumManagementApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
