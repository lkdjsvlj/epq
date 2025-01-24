//
//  ContentView.swift
//  EPQ PROJECT
//
//  Created by laurie moss on 26/12/2024.
//

import SwiftUI

struct symptoms: View {
    @StateObject private var selectionModel = SymptomSelectionModel()
    var body: some View {
        
        NavigationStack {
            VStack {
                
                ZStack {
                    Rectangle()
                        .fill(Color("med blue"))
                        .frame(width:400, height:70)
                    HStack {
                        VStack {
                            Image("logo")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 60.0, height: 60.0)
                                .clipShape(Circle())
                            //.padding()
                        }//vstack
                    }//hstack
                }//zstack
                
                Spacer()
                
                Text("Symptoms")
                    .padding()
                    .font(.title)
                    .foregroundColor(Color("AccentColor"))
                
                Spacer()
                
                Text("The more symptoms a diagnosis algorithm asks for and considers, the more accurate it is likely to be.")
                    .padding()
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("Input your symptoms here. Click 'View Diagnosis' when you're ready.")
                    .padding()
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                List {
                    NavigationLink(destination: SymptomSelectionView(category: "Physical Symptoms", symptoms: ["Hair Loss", "Sweating", "Swollen Gums", "Swollen Joints", "Tumour-like Lumps", "Headaches", "Joint Pain", "Stiff Neck"], selectionModel: selectionModel)) {
                        Text("Physical Symptoms")
                    }
                    NavigationLink(destination: SymptomSelectionView(category: "Skin Symptoms", symptoms: ["Blisters", "Bruising", "Rash", "Red Skin", "Lesions", "Small Hives", "Sores", "Itching", "Burning"], selectionModel: selectionModel)) {
                        Text("Skin Symptoms")
                    }
                    NavigationLink(destination: SymptomSelectionView(category: "Sensory and Functional Symptoms", symptoms: ["Trouble with Breathing", "Trouble with Eyesight", "Trouble with Hearing", "Trouble with Speech", "Trouble with Walking", "Trouble with Swallowing", "Trouble with Healing", "Uncontrollable Movement"], selectionModel: selectionModel)) {
                        Text("Sensory and Functional Symptoms")
                    }
                    NavigationLink(destination: SymptomSelectionView(category: "Digestive Symptoms", symptoms: ["Stomachaches", "Nausea", "Constipation", "Diarrhoea", "Seizures", "Delirium", "Numbness"], selectionModel: selectionModel)) {
                        Text("Digestive Symptoms")
                    }
                    NavigationLink(destination: SymptomSelectionView(category: "General Symptoms", symptoms: ["Fever", "Fatigue", "Rapid Pulse"], selectionModel: selectionModel)) {
                        Text("General Symptoms")
                    }
                    NavigationLink(destination: diagnosis()) {
                        Text("View Diagnosis")
                    }
                    .padding()
                    .background(Color("med blue"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }//list
                .foregroundColor(Color("med blue"))
                .cornerRadius(12)
                
            }//vstack
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .status) {
                    NavigationLink(destination: about()) {
                        VStack {
                            Image(systemName: "brain.head.profile")
                            Text("About")
                        }
                    }//nlink
                    NavigationLink(destination: symptoms()) {
                        VStack {
                            Image(systemName: "waveform.path.ecg.text.clipboard")
                            Text("Quiz")
                        }
                    }//nlink
                    NavigationLink(destination: info()) {
                        VStack {
                            Image(systemName: "waveform.path.ecg.magnifyingglass")
                            Text("Info")
                        }//vstack
                    }//nlink
                    NavigationLink(destination: sources()) {
                        VStack {
                            Image(systemName: "link")
                            Text("Sources")
                        }//vstack
                    }//nlink
                }//toolbarIG
            }//toolbar
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }//nview
    }
}

struct SymptomSelectionView: View {
    var category: String
    var symptoms: [String]
    @ObservedObject var selectionModel: SymptomSelectionModel
    @State private var selectedOptions: [Bool]
    
    init(category: String, symptoms: [String], selectionModel: SymptomSelectionModel) {
        self.category = category
        self.symptoms = symptoms
        self.selectionModel = selectionModel
        _selectedOptions = State(initialValue: Array(repeating: false, count: symptoms.count))
    }//init

    var body: some View {
        
        VStack {
            Text("Select your symptoms from \(category)")
                .font(.title)
                .foregroundColor(Color("med blue"))
                .padding()
            
            List {
                ForEach(0..<symptoms.count, id: \.self) { index in
                    ChoiceRow(option: symptoms[index], isSelected: $selectedOptions[index])
                }//foreach
            }//list
            
        }//vstack
        .navigationTitle(category)
        .onDisappear {
            selectionModel.selectedSymptoms.append(contentsOf: getSelectedOptions())
        }//ondisappear
    }

    func getSelectedOptions() -> [String] {
        zip(symptoms, selectedOptions)
            .filter { $0.1 }
            .map { $0.0 }
    }//func
}

struct ChoiceRow: View {
    let option: String
    @Binding var isSelected: Bool
    var body: some View {
        
        HStack {
            Text(option)
                .foregroundColor(Color("med blue"))
            Spacer()
            Image(systemName: isSelected ? "checkmark.square" : "square")
                .foregroundColor(isSelected ? Color("AccentColor") : Color("med blue"))
                .onTapGesture {
                    isSelected.toggle()
                }//ontap
        }//hstack
        .padding()
        
    }
}

#Preview {
    symptoms()
}
