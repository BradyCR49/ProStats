//
//  ContentView.swift
//  ProStats
//
//  Created by Brady Rhodes on 8/28/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var pflTeams = ["Butler","Davidson","Dayton","Drake","Marist","Morehead State","Presbyterian","San Diego","St Thomas","Stetson","Valparaiso"]
    var teamViews = [ButlerView(), DavidsonView(),DrakeView(), MaristView(), MoreheadStateView(), PresbyterianView(), SanDiegoView(), StThomasView(), StetsonView(), ValparaisoView()]
    let columns = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    
    let height: CGFloat = 10
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 25){
                ForEach(Array(zip(pflTeams, teamViews)), id: \.0) { team in
                    NavigationLink(destination: team.1, label: {Text("\(team.0)")
                            .bold()
                            .frame(width: 120, height: 60)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
                .navigationTitle("Pioneer League")
                
            }
            .offset(x: 10, y: -50)
        }
        .accentColor(Color(.label))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

