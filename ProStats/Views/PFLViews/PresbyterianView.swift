//
//  PresbyterianView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//

import SwiftUI
import Firebase

struct PresbyterianView: View {
    @ObservedObject var model = ViewModel(collection: "PresbyterianData")
    
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

struct PresbyterianView_Previews: PreviewProvider {
    static var previews: some View {
        PresbyterianView()
            .environmentObject(ViewModel(collection: "PresbyterianData"))
    }
}
