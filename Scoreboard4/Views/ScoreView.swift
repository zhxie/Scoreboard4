//
//  ScoreView.swift
//  Scoreboard4
//
//  Created by Sketch on 2021/7/5.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            ControllerView(steps: modelData.steps, scores: $modelData.scores, table: $modelData.table, id: 0)
                .rotationEffect(.degrees(180))
            
            Spacer()
            
            HStack {
                ControllerView(steps: modelData.steps, scores: $modelData.scores, table: $modelData.table, id: 1)
                    .rotated(.degrees(90))
                
                Spacer()
                
                Text(String(format: "%d", modelData.table))
                    .font(.system(size: 96.0))
                    .fontWeight(.bold)
                    .underline()
                    .lineLimit(1)
                    .rotated(.degrees(90))
                
                Spacer()
                
                ControllerView(steps: modelData.steps, scores: $modelData.scores, table: $modelData.table, id: 3)
                    .rotated(.degrees(-90))
            }
            
            Spacer()
            
            ControllerView(steps: modelData.steps, scores: $modelData.scores, table: $modelData.table, id: 2)
        }
        .padding()
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        modelData.steps = [1, 5, 10]
        modelData.scores = [10, 10, 10, 10]
        modelData.table = 0
        
        return ScoreView()
            .environmentObject(modelData)
    }
}
