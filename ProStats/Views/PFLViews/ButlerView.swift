//
//  ButlerView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/21/22.
//

import SwiftUI
import Firebase

struct ButlerView: View {
    @ObservedObject var model = ViewModel(collection: "ButlerData")
    
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

struct ButlerView_Previews: PreviewProvider {
    static var previews: some View {
        ButlerView()
            .environmentObject(ViewModel(collection: "ButlerData"))
    }
}

