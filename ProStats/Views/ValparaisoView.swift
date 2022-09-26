//
//  ValparaisoView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//

import SwiftUI
import Firebase

struct ValparaisoView: View {
    @ObservedObject var model = ViewModel(collection: "ValparaisoData")
    
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

struct ValparaisoView_Previews: PreviewProvider {
    static var previews: some View {
        StThomasView()
            .environmentObject(ViewModel(collection: "ValparaisoData"))
    }
}
