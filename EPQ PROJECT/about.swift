//
//  about.swift
//  EPQ PROJECT
//
//  Created by laurie moss on 26/12/2024.
//

import SwiftUI

struct about: View {
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
                
                VStack {
                    Text("Anamnesis")
                        .font(.largeTitle)
                        .foregroundColor(Color("AccentColor"))
                    Text("Symptoms, Reimagined.")
                        .font(.title3)
                        .foregroundColor(Color("med blue"))
                }//vstack
                .padding()
                
                Text("Welcome to Anamnesis, the app where real symptoms are reimagined for rare diseases.")
                    .padding()
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                Text("Misinformation plagues the Internet, our largest and most accessible resource. Damage can be done when users looking for medical advice online place their trust in misinformed or malicious sources. This is detrimental in myriad ways for both patients and GPs.")
                    .padding()
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                Text("Anamnesis is the diagnosis app with a difference, aiming to raise awareness of the risks of medical misinformation. The obvious unlikelihood of the diseases we diagnose is designed to shock users into action: next time they receive an online diagnosis, we hope they won’t trust it as implicitly.")
                    .padding()
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
            }//vstack
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .status) {
                    NavigationLink(destination: about()) {
                        VStack {
                            Image(systemName: "brain.head.profile")
                            Text("About")
                        }//vstack
                    }//nlink
                    NavigationLink(destination: symptoms()) {
                        VStack {
                            Image(systemName: "waveform.path.ecg.text.clipboard")
                            Text("Quiz")
                        }//vstack
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
        }//nstack
    }
}

#Preview {
    about()
}
