//
//  info.swift
//  EPQ PROJECT
//
//  Created by laurie moss on 27/12/2024.
//

import SwiftUI

struct info: View {
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
                
                Text("Warning Signs")
                    .padding()
                    .font(.title)
                    .foregroundColor(Color("AccentColor"))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Text("The most effective way to combat medical misinformation is to employ common sense and skepticism. If you're seriously concerned about your health, consult a GP.")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color("dark blue"))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Text("However, if you do decide to use a diagnosis site or app, they should be trustworthy. Click on the signs below to learn more.")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color("dark blue"))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }//vstack
                .padding()
                
                VStack {
                    Menu("Lack of credibility") {
                        Text("The quiz isn’t hosted on a reputable website")
                        Text("No credentials or qualifications provided")
                        Text("Sources and research aren’t cited")
                    }//menu
                    
                    Menu("Generic or sensational questions and claims") {
                        Text("Questions are vague or overly simplistic")
                        Text("Use of exaggerated language")
                        Text("Cure or definitive answers are guaranteed")
                    }//menu
                    
                    Menu("Sales tactics") {
                        Text("Purchase of specific products is encouraged")
                        Text("Ads or promotions dominate the page")
                        Text("Payment is required to view the results")
                    }//menu
                    
                    Menu("Simplistic diagnoses") {
                        Text("Wide range of symptoms are not considered")
                        Text("Medical history is not considered")
                    }//menu
                    
                    Menu("Poor website design") {
                        Text("Grammatical errors")
                        Text("Typos")
                        Text("Poorly-formatted content")
                        Text("Unprofessional finish")
                    }//menu
                    Spacer()
                }//vstack
                .padding()
                
                Spacer()
                
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
        }//nstack
    }
}

#Preview {
    info()
}
