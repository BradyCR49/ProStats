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
                FCSConferenceView()
                    .tabItem {
                        Label("Conferences", systemImage: "house")
                    }
                Text(" ")
                    .tabItem {
                        Label("Players", systemImage: "book")
                    }
                Text(" ")
                    .tabItem {
                        Label("", systemImage: "plus.circle")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
