//
//  CoreDataSwiftUIApp.swift
//  CoreDataSwiftUI
//
//  Created by JeongminKim on 2022/06/03.
//

import SwiftUI

@main
struct CoreDataSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
