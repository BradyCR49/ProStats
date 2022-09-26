//
//  MoreheadStateView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//

import SwiftUI
import Firebase

struct MoreheadStateView: View {
    @ObservedObject var model = ViewModel(collection: "MoreheadStateData")
    
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

struct MoreheadStateView_Previews: PreviewProvider {
    static var previews: some View {
        MoreheadStateView()
            .environmentObject(ViewModel(collection: "MoreheadStateData"))
    }
}
