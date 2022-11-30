//
//  ButlerView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/21/22.
//

import SwiftUI
import Firebase
import SwiftUICharts

struct ButlerView: View {
    @ObservedObject var model = ViewModel(collection: "ButlerData")
    var body: some View {
            VStack {
                List {
                    Section(header: Text("Team Stats")) {
                        ForEach(model.teamDataList) { item in
                            Text("\(item.Team)")
                                .bold()
                                .font(.title)
                            Text("Record: \(item.Record)")
                            Text("Total Yards: \(item.totYards)")
                            Text("Passing Yards: \(item.pYards)")
                            Text("Rushing Yards: \(item.rYards)")
                        }
                    }
                    Section(header: Text("Per Game Graphs")) {
                            ForEach (model.teamDataList) { items in
                                let keysTotY = items.totYardsConf.map{$0.key}
                                let valuesTotY = items.totYardsConf.map{$0.value}
                                let keysPassY = items.totYardsConf.map{$0.key}
                                let valuesPassY = items.totYardsConf.map{$0.value}
                                HStack{
                                    BarChartView(data: ChartData(values: keysTotY.indices.map { index in
                                        ("\(keysTotY[index])",
                                         valuesTotY[index])}),
                                                 title: "Yards Per Game",
                                                 legend: "Vs. Conference Opponents",
                                                 valueSpecifier: "%.0f Tot Off Yards")
                                    VStack{
                                        Text("Butler had the most yards per game Vs. Dayton")
                                            .padding(.bottom)
                                        Text("They had the least amount of yards Vs. Morehead St.")
                                    }
                                }
                                BarChartView(data: ChartData(values: keysPassY.indices.map { index in
                                    ("\(keysPassY[index])",
                                     valuesPassY[index])}),
                                             title: "Pass Yards Per Game",
                                             legend: "Vs. Conference Opponents",
                                             valueSpecifier: "%.0f Pass Yards")
                                
                        }
                    }
                }
                .listStyle(.grouped)

            }
        }
    
    init(){
        model.getData()
    }
}
struct ButlerView_Previews: PreviewProvider {
    static var previews: some View {
        ButlerView()
            .environmentObject(ViewModel(collection: "ButlerData"))
    }
}
