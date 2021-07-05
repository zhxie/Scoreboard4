//
//  ContentView.swift
//  Scoreboard4
//
//  Created by Sketch on 2021/7/5.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var showConfiguration = false
    
    var body: some View {
        ScoreView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        modelData.steps = [1, 5, 10]
        modelData.scores = [10, 10, 10, 10]
        modelData.table = 0
        
        return ContentView()
            .environmentObject(modelData)
    }
}
