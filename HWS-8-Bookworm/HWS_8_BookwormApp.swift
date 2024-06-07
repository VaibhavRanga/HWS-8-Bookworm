//
//  HWS_8_BookwormApp.swift
//  HWS-8-Bookworm
//
//  Created by Vaibhav Ranga on 06/06/24.
//

import SwiftData
import SwiftUI

@main
struct HWS_8_BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
