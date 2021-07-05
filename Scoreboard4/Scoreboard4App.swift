//
//  Scoreboard4App.swift
//  Scoreboard4
//
//  Created by Sketch on 2021/7/5.
//

import SwiftUI

@main
struct ScorerApp: App {
    @StateObject var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
