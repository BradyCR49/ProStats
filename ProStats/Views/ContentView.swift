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
    var pflTeams = ["Butler","Davidson","Dayton","Drake","Marist","Morehead State","Presbyterian","San Diego","St Thomas","Stetson","Valparaiso"]
    
    var teamViews = [AnyView(ButlerView()), AnyView(DavidsonView()), AnyView(DaytonView()), AnyView(DrakeView()), AnyView(MaristView()), AnyView(MoreheadStateView()), AnyView(PresbyterianView()), AnyView(SanDiegoView()), AnyView(StThomasView()), AnyView(StetsonView()), AnyView(ValparaisoView())]
    
    let columns =
    [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let height: CGFloat = 10
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 25){
                    ForEach(Array(zip(pflTeams, teamViews)), id: \.0) { team in
                        NavigationLink(destination: AnyView(team.1), label: {Text("\(team.0)")
                                .bold()
                                .frame(width: 115, height: 60)
                                .foregroundColor(.accentColor)
                                .background(.gray)
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

