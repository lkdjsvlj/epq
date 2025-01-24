//
//  sources.swift
//  EPQ PROJECT
//
//  Created by laurie moss on 26/12/2024.
//

import SwiftUI

struct sources: View {
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
                
                Text("Sources")
                    .padding()
                    .font(.title3)
                    .foregroundColor(Color("AccentColor"))
                
                Spacer()
                
                Text("One way to ensure you’re receiving reliable medical advice is to check the site’s sources and affiliations. Do you trust them?")
                //Text("It's important to check the site's credibility. Are the credentials or qualifications provided? Are the sources cited and reliable?")
                    .padding()
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("Websites")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                List {
                    Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                        Text("link1")
                    }//link
                    Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                        Text("link2")
                    }//link
                }//list
                .cornerRadius(12)
                
                Text("Literature")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                List {
                    Text("book")
                    Text("article")
                }//list
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(Color("dark blue"))
                .multilineTextAlignment(.center)
                .cornerRadius(12)
                
                Text("Places")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("dark blue"))
                    .multilineTextAlignment(.center)
                
                List {
                    Text("museum")
                    Text("library")
                }//list
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(Color("dark blue"))
                .multilineTextAlignment(.center)
                .cornerRadius(12)
                
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
    sources()
}
