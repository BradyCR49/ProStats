//
//  ContentView.swift
//  ProStats
//
//  Created by Brady Rhodes on 8/28/22.
//

import SwiftUI
import Firebase
import SwiftUICharts

struct ContentView: View {
    
    var body: some View {
            TabView{
                DivisionView()
                    .tabItem {
                        Label("Conferences", systemImage: "football")
                    }
                Text(" ")
                    .tabItem {
                        Label("Players", systemImage: "figure.american.football")
                    }
            }
            .accentColor(.black)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
