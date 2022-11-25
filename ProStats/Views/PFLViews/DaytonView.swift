//
//  DaytonView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//

import SwiftUI
import Firebase
import SwiftUICharts

struct DaytonView: View {
    @ObservedObject var model = ViewModel(collection: "PFLConfData")
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Offensive Efficiency")) {
                    ForEach (model.teamDataList) { items in
                        let keysOffEff = items.offEffRating.map{$0.key}
                        let valuesOffEff = items.offEffRating.map{$0.value}
                        BarChartView(data: ChartData(values: keysOffEff.indices.map { index in
                            ("\(keysOffEff[index])",
                             valuesOffEff[index])}),
                                     title: "Yards Per Game",
                                     legend: "Vs. Conference Opponents",
                                     valueSpecifier: "%.2f Tot Off Yards")
                    }
                }
            }
        }
    }
    
    init(){
        model.getData()
    }
}

struct DaytonView_Previews: PreviewProvider {
    static var previews: some View {
        DaytonView()
            .environmentObject(ViewModel(collection: "DaytonData"))
    }
}
