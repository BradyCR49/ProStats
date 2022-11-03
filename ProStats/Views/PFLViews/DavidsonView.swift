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
                List(model.teamDataList) { item in
                    Text(item.Team)
                        .navigationTitle(item.Team)
                    Text("Record: \(item.Record)")
                    Text("Total Yards: \(item.TotYards)")
                }
                List(model.teamDataList) { item in
                    let keys = item.gOnetot.map{$0.key}
                    let values = item.gOnetot.map{$0.value}
                    ForEach(keys.indices) { index in
                        BarChartView(data: ChartData(values: [
                            ("\(keys[index])",values[index]),
                        ]), title: "Yards Per Game",legend: "Vs. Conference Opponents", form: ChartForm.medium,valueSpecifier: "%.0f Yards")
                    }
                        /*BarChartView(data: ChartData(values: [
                            ("\()",item.gOnetot.values.first!),
                            ("\(item.gOnetot.keys.first!)", item.gOnetot.values.first!),
                            ("Vs. Presbyterian", item.gThreetot),
                            ("Vs. Butler", item.gFourtot),
                            ("Vs. Morehead State", item.gFivetot),
                            ("Vs. St. Thomas", item.gSixtot),
                            ("Vs. Dayton", item.gSevtot),
                            ("Vs. Drake", item.gEighttot),
                            
                        ]), title: "Yards Per Game",legend: "Vs. Conference Opponents", form: ChartForm.medium,valueSpecifier: "%.0f Yards")*/
                }
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
            .environmentObject(ViewModel(collection: "DavidsonData"))
    }
}
