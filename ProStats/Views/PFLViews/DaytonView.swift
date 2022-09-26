//
//  DaytonView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//

import SwiftUI
import Firebase

struct DaytonView: View {
    @ObservedObject var model = ViewModel(collection: "DaytonData")
    
    var body: some View {
        NavigationView {
            List(model.teamDataList) { item in
                Text(item.Team)
                    .navigationTitle(item.Team)
                Text(item.Record)
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
