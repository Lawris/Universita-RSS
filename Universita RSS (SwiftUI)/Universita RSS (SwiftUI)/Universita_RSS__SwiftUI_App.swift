//
//  Universita_RSS__SwiftUI_App.swift
//  Universita RSS (SwiftUI)
//
//  Created by Loris Plasson Simoni on 22/12/2020.
//

import SwiftUI

@main
struct Universita_RSS__SwiftUI_App: App {
    
    static let vm = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Universita_RSS__SwiftUI_App.vm)
        }
    }
}
