//
//  diagnosis.swift
//  EPQ PROJECT
//
//  Created by laurie moss on 26/12/2024.
//

import SwiftUI

// Main `diagnosis` view
struct diagnosis: View {
    @StateObject private var selectionModel = SymptomSelectionModel()

    var body: some View {
        DiagnosisView(
            diseases: ["Alien Hand Syndrome", "Aquagenic Urticaria", "Auto-Brewery Syndrome", "Bubonic Plague", "Dancing Mania", "Dracunculiasis", "Dysentery", "Fibrodysplasia Ossificans Progressiva", "Gout", "Leprosy", "Lithopedion", "Rabies", "Scurvy", "Smallpox", "Solar Urticaria", "Sweating Sickness", "Syphilis"],
            info: [
                "Alien Hand Syndrome": ["Uncontrollable Movement"],
                "Aquagenic Urticaria": ["Itching", "Small Hives", "Rash", "Burning", "Trouble with Breathing", "Trouble with Swallowing"],
                "Auto-Brewery Syndrome": ["Seizures", "Delirium", "Nausea", "Fatigue", "Stomachaches", "Constipation", "Diarrhoea", "Trouble with Walking", "Trouble with Eyesight", "Trouble with Speech"],
                "Bubonic Plague": ["Fever", "Delirium", "Nausea", "Fatigue", "Sores", "Headaches"],
                "Dancing Mania": ["Seizures", "Delirium", "Fatigue", "Sweating", "Uncontrollable Movement", "Trouble with Breathing", "Trouble with Swallowing"],
                "Dracunculiasis": ["Blisters"],
                "Dysentery": ["Fever", "Stomachaches", "Diarrhoea"],
                "Fibrodysplasia Ossificans Progressiva": ["Tumour-like Lumps", "Joint Pain", "Stiff Neck", "Trouble with Walking", "Trouble with Breathing"],
                "Gout": ["Red Skin", "Joint Pain", "Stiff Neck"],
                "Ichthyosis": ["Blisters", "Red Skin", "Trouble with Eyesight", "Trouble with Hearing"],
                "Leprosy": ["Lesions", "Red Skin", "Numbness", "Trouble with Healing"],
                "Lithopedion": ["Tumour-like Lumps", "Stomachaches", "Constipation"],
                "Rabies": ["Seizures", "Delirium", "Numbness", "Trouble with Breathing", "Trouble with Swallowing"],
                "Scurvy": ["Fever", "Fatigue", "Red Skin", "Bruising", "Headaches", "Joint Pain", "Stiff Neck", "Trouble with Eyesight", "Trouble with Speech", "Trouble with Healing"],
                "Smallpox": ["Fever", "Itching", "Nausea", "Fatigue", "Small Hives", "Lesions", "Rash", "Stomachaches"],
                "Solar Urticaria": ["Itching", "Nausea", "Small Hives", "Blisters", "Rash", "Headaches", "Rapid Pulse", "Burning"],
                "Sweating Sickness": ["Fever", "Delirium", "Fatigue", "Sweating", "Headaches", "Stiff Neck", "Rapid Pulse"],
                "Syphilis": ["Seizures", "Fatigue", "Sores", "Rash", "Joint Pain", "Headaches"]
            ],
            selectionModel: selectionModel
        )
    }
}

// Subview for diagnosis calculation and display
struct DiagnosisView: View {
    let diseases: [String]
    let info: [String: [String]]
    @ObservedObject var selectionModel: SymptomSelectionModel

    func pointsForDisease(_ disease: String) -> Int {
        guard let diseaseSymptoms = info[disease] else {
            return 0
        }

        var points = 0


        // Exact match check (order-insensitive)
        if Set(diseaseSymptoms) == Set(selectionModel.selectedSymptoms) {
            points += 5
        }

        // Check for matches between selected symptoms and disease symptoms
        for inputSymptom in selectionModel.selectedSymptoms {
            if diseaseSymptoms.contains(inputSymptom) {
                points += 1 // Reward for matching a symptom
            }
        }

        // Penalize for symptom count mismatch
        let symptomCountDifference = abs(diseaseSymptoms.count - selectionModel.selectedSymptoms.count)
        points -= symptomCountDifference

        return points
    }


    var body: some View {
        VStack {
            Text("Diagnosis Results")
                .font(.title)
                .foregroundColor(Color("AccentColor"))

            List(diseases, id: \.self) { disease in
                HStack {
                    Text(disease)
                    Spacer()
                    Text("Points: \(pointsForDisease(disease))")
                }
            }
        }
    }
}


#Preview {
    diagnosis()
}
