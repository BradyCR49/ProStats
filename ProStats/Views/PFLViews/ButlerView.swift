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
        NavigationView {
            VStack {
                List(model.teamDataList) { item in
                    Text(item.Team)
                        .navigationTitle(item.Team)
                    Text("Record: \(item.Record)")
                    Text("Total Yards: \(item.TotYards)")
                }
                List(model.teamDataList) { item in
                    BarChartView(data: ChartData(values: [
                        ("Vs. St Thomas",item.gOnetot),
                        ("Vs. Drake", item.gTwotot),
                        ("Vs. San Diego", item.gThreetot),
                        ("Vs. Morehead", item.gFourtot),
                        ("Vs. Davidson", item.gFivetot),
                        ("Vs. Dayton", item.gSixtot),
                        ("Vs. Valparaiso", item.gSevtot),
                        ("Vs. Marist", item.gEighttot),
                        
                    ]), title: "Yards Per Game",legend: "Vs. Conference Opponents", form: ChartForm.medium,valueSpecifier: "%.0f Yards")
                }
            }
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
