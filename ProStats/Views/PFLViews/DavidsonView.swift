//
//  DavidsonView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//
import SwiftUI
import Firebase
import SwiftUICharts

struct DavidsonView: View {
    @ObservedObject var model = ViewModel(collection: "DavidsonData")
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Team Stats")) {
                        ForEach(model.teamDataList) { item in
                            Text("Record: \(item.Record)")
                            Text("Total Yards: \(item.totYards)")
                                .navigationTitle(item.Team)
                        }
                    }
                    Section(header: Text("Per Game Graphs")) {
                        ForEach (model.teamDataList) { items in
                            let keys = items.totYardsConf.map{$0.key}
                            let values = items.totYardsConf.map{$0.value}
                            BarChartView(data: ChartData(values: keys.indices.map { index in
                                ("\(keys[index])",
                                 values[index])}),
                            title: "Yards Per Game",
                            legend: "Vs. Conference Opponents",
                            valueSpecifier: "%.0f Tot Off Yards")
                        }
                    }
                }
                .listStyle(.grouped)
            }
        }
    }
    init(){
        model.getData()
    }
}

struct DavidsonView_Previews: PreviewProvider {
    static var previews: some View {
        DavidsonView()
    }
}
