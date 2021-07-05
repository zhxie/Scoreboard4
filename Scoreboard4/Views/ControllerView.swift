//
//  ControllerView.swift
//  Scoreboard4
//
//  Created by Sketch on 2021/7/5.
//

import SwiftUI

struct ControllerView: View {
    var steps: [Int]
    @Binding var scores: [Int]
    @Binding var table: Int
    var id: Int
    
    var body: some View {
        HStack {
            Text(String(format: "%d", scores[id]))
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(1)
                .padding(.horizontal, 12)
                .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            
            ForEach (steps, id: \.self) { step in
                Button {
                    scores[id] = scores[id] - step
                    table = table + step
                } label: {
                    Text(String(format: "%d", step))
                        .padding(.vertical, 7)
                        .padding(.horizontal, 12)
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                }
            }
            
            Button {
                scores[id] = scores[id] + table
                table = 0
            } label: {
                Text(String("Withdraw"))
                    .padding(.vertical, 7)
                    .padding(.horizontal, 12)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
        }
    }
}

struct ControllerView_Previews: PreviewProvider {
    static var previews: some View {
        return ControllerView(steps: [0], scores: .constant([0]), table: .constant(0), id: 0)
    }
}
