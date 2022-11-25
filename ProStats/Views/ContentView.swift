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
    @ObservedObject var model = ViewModel(collection: "PFLConfData")
    
    var pflTeams = ["Butler","Davidson","Dayton","Drake","Marist","Morehead State","Presbyterian","San Diego","St Thomas","Stetson","Valparaiso"]
    
    var teamViews = [AnyView(ButlerView()), AnyView(DavidsonView()), AnyView(DaytonView()), AnyView(DrakeView()), AnyView(MaristView()), AnyView(MoreheadStateView()), AnyView(PresbyterianView()), AnyView(SanDiegoView()), AnyView(StThomasView()), AnyView(StetsonView()), AnyView(ValparaisoView())]
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Teams")) {
                    ForEach(Array(zip(pflTeams, teamViews)), id: \.0) { team in
                        NavigationLink(destination: AnyView(team.1), label: {Text("\(team.0)")
                                .bold()
                                .foregroundColor(.accentColor)
                        })
                    }
                }
                .navigationTitle("Pioneer League")
                .accentColor(Color(.label))
                Section(header: Text("Conference Standings")) {
                    ForEach (model.teamDataList) { items in
                        let keysOffEff = items.offEffRating.map{$0.key}
                        let valuesOffEff = items.offEffRating.map{$0.value}
                        let keysDefEff = items.defEffRating.map{$0.key}
                        let valuesDefEff = items.defEffRating.map{$0.value}
                        HStack{
                            BarChartView(data: ChartData(values: keysOffEff.indices.map { index in
                                ("\(keysOffEff[index])",
                                 valuesOffEff[index])}),
                                         title: "Offensive Rating",
                                         legend: "2021 Yards Per Play",
                                         
                                         valueSpecifier: "%.2f Off Efficiency")
                            
                            Text("The Higher the Rating the Better")
                        }
                        HStack{
                            BarChartView(data: ChartData(values: keysDefEff.indices.map { index in
                                ("\(keysDefEff[index])",
                                 valuesDefEff[index])}),
                                         title: "Defensive Rating",
                                         legend: "2021 Yards Allowed Per Play",
                                         valueSpecifier: "%.2f Def Efficiency")
                            Text("The Lower the Rating the Better")
                        }
                    }
                }
                .accentColor(Color(.label))
            }
            .listStyle(.grouped)
        }
    }
    init(){
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel(collection: "PFLConfData"))
    }
}

