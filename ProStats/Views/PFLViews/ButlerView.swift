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
            VStack{
            List(model.teamDataList) { item in
                Text(item.Team)
                    .navigationTitle(item.Team)
                Text(item.Record)
                
            }
                PieChartView(data: [8,23,54,32], title: "Title", legend: "Legendary")
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

