//
//  ConfigurationView.swift
//  Scoreboard4
//
//  Created by Sketch on 2021/7/5.
//

import SwiftUI

struct ConfigurationView: View {
    @StateObject var modelData = ModelData()
    
    @Binding var isPresented: Bool
    
    @Binding var initial: Int
    @Binding var steps: [Int]
    @Binding var scores: [Int]
    @Binding var table: Int
    
    @State var initialText = "0"
    @State var stepTexts = ["1", "5", "10"]
    @State var tableText = "0"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Player")) {
                    HStack {
                        Text("Number")
                        
                        Spacer()
                        
                        TextField("Number", text: .constant("4"))
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .disabled(true)
                    }
                    HStack {
                        Text("Initial Value")
                        
                        Spacer()

                        TextField("Initial Value", text: $initialText)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                Section(header: Text("Controller")) {
                    ForEach(0..<stepTexts.count, id: \.self) { index in
                        HStack {
                            Button(action: { stepTexts.remove(at: index) }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                            TextField("Step", text: getBinding(forIndex: index))
                                .keyboardType(.numberPad)
                        }
                    }
                    .transition(.identity)
                    Button(action: { stepTexts.append("") }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                            Text("Add Step")
                        }
                    }
                }
                
                Section(header: Text("Board")) {
                    HStack {
                        Text("Initial Value")
                        
                        Spacer()
                        
                        TextField("Initial Value", text: $tableText)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationTitle("Configuration")
            .navigationBarItems(trailing: Button("Finish") {
                initial = Int(initialText) ?? 0
                steps.removeAll()
                for stepText in stepTexts {
                    guard let step = Int(stepText) else {
                        continue
                    }
                    
                    steps.append(step)
                }
                for i in 0...3 {
                    scores[i] = initial
                }
                table = Int(tableText) ?? 0
                
                isPresented.toggle()
            })
        }
    }
    
    func getBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { stepTexts[index] },
                               set: { stepTexts[index] = $0 })
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        return ConfigurationView(isPresented: .constant(true), initial: .constant(0), steps: .constant([1, 5, 10]), scores: .constant([0, 0, 0, 0]), table: .constant(0))
    }
}
