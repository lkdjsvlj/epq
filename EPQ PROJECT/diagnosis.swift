//
//  diagnosis.swift
//  EPQ PROJECT
//
//  Created by laurie moss on 26/12/2024.
//

import SwiftUI

struct diagnosis: View {
    @StateObject private var selectionModel = SymptomSelectionModel()
    var body: some View {
        
        DiagnosisView(
            diseases: ["Alien Hand Syndrome",
                       "Aquagenic Urticaria",
                       "Auto-Brewery Syndrome",
                       "Bubonic Plague",
                       "Dancing Mania",
                       "Dracunculiasis",
                       "Dysentery",
                       "Fibrodysplasia Ossificans Progressiva",
                       "Gout",
                       "Leprosy",
                       "Lithopedion",
                       "Rabies",
                       "Scurvy",
                       "Smallpox",
                       "Solar Urticaria",
                       "Sweating Sickness",
                       "Syphilis"],
            
            info: ["Alien Hand Syndrome": ["Uncontrollable Movement"],
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
                   "Syphilis": ["Seizures", "Fatigue", "Sores", "Rash", "Joint Pain", "Headaches"]],
            selectionModel: selectionModel
        )//diagnosisview
    }
}

struct DiagnosisView: View {
    let diseases: [String]
    let info: [String: [String]]
    @ObservedObject var selectionModel: SymptomSelectionModel

    func pointsForDisease(_ disease: String) -> Int {
        guard let diseaseSymptoms = info[disease] else {
            return 0
        }//let
        
        //initialise points
        var points = 0
        
        //if the input symptoms exactly match a disease's symptom set, 5 points are granted to that disease
        //set function means order is disregarded
        if Set(diseaseSymptoms) == Set(selectionModel.selectedSymptoms) {
            points += 5
        }//if

        //iterates through input symptoms, granting 1 point to each disease with said symptom in their symptom set
        for inputSymptom in selectionModel.selectedSymptoms {
            if diseaseSymptoms.contains(inputSymptom) {
                points += 1
            }//if
        }//for

        //calculates the absolute value of the difference between the number of input symptoms and the number of symptoms in a disease's symptom set
        //subtracts difference from the disease's points
        let symptomCountDifference = abs(diseaseSymptoms.count - selectionModel.selectedSymptoms.count)
        points -= symptomCountDifference

        return points
    }//func

    /*var body: some View {
        
        VStack {
            Text("Diagnosis Results")
                .font(.title)
                .foregroundColor(Color("AccentColor"))

            List(diseases, id: \.self) { disease in
                HStack {
                    Text(disease)
                    Spacer()
                    Text("Points: \(pointsForDisease(disease))")
                }//hstack
            }//list
            
        }//vstack
    }*/
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
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
                    
                    Text("Leprosy")
                        .padding()
                        .font(.title)
                        .foregroundColor(Color("AccentColor"))
                    Spacer()
                    
                    HStack {
                        Image("lep1")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                        Image("lep2")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                    }//hstack
                    .padding()
                    
                    VStack {
                        Text("Leprosy is a chronic infectious disease, caused by the bacterium Mycobacterium leprae.")
                        Text("It is transmitted by close and frequent contact with untreated cases.")
                        Text("It predominantly affects the skin and peripheral nerves.")
                        Text("Untreated, it causes progressive and permanent disabilities.")
                        Text("It is curable with multidrug therapy.")
                    }//vstack
                    .padding()
                    //.padding()
                    .foregroundColor(Color("med blue"))
                    .multilineTextAlignment(.center)
                    //.background(Rectangle().foregroundColor(Color("med blue")).opacity(0.2))
                    .cornerRadius(12)
                    
                    HStack {
                        Image("lep3")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                            .padding()
                        
                        VStack {
                            Menu("Symptoms") {
                                Text("Thick, stiff or dry skin")
                                Text("Painless swelling or lumps on the face and earlobes")
                                Text("Loss of eyebrows or eyelashes")
                                Text("Numbness in affected skin areas")
                                Text("Muscle weakness or paralysis")
                            }//menu
                            
                            Menu("Complications") {
                                Text("Paralysis and crippling of hands and feet")
                                Text("Chronic non-healing ulcers")
                                Text("Blindness")
                                Text("Disfigurement")
                                Text("Loss of limbs")
                            }//menu
                            
                            Menu("Risk Factors") {
                                Text("Contact with another infected person")
                                Text("Living in poverty")
                                Text("Malnutrition")
                                Text("Poor immune function")
                            }//menu
                            
                            Menu("Treatment") {
                                Text("MDT to combat the bacterial infection")
                                Text("Highly effective")
                                Text("Safe")
                                Text("Easy to use")
                                Text("Should begin immediately")
                            }//menu
                        }//vstack
                        .padding()
                        .foregroundColor(Color("AccentColor"))
                        .multilineTextAlignment(.center)
                        
                    }//hstack
                    .padding()
                    
                }//vstack
                .padding()
            }//scrollview
        }//nstack
    }
}

#Preview {
    diagnosis()
}
