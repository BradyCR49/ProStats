//
//  SanDiegoView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//

import SwiftUI
import Firebase

struct SanDiegoView: View {
    @ObservedObject var model = ViewModel(collection: "SanDiegoData")
    
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

struct SanDiegoView_Previews: PreviewProvider {
    static var previews: some View {
        SanDiegoView()
            .environmentObject(ViewModel(collection: "SanDiegoData"))
    }
}
