//
//  ModelData.swift
//  Scoreboard4
//
//  Created by Sketch on 2021/7/5.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var initial: Int = 0
    @Published var steps: [Int] = [1, 5, 10]
    @Published var scores: [Int] = [0, 0, 0, 0]
    @Published var table: Int = 0
}
