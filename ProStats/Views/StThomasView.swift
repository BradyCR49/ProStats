//
//  StThomasView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//

import SwiftUI
import Firebase

struct StThomasView: View {
    @ObservedObject var model = ViewModel(collection: "StThomasData")
    
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

struct StThomasView_Previews: PreviewProvider {
    static var previews: some View {
        StThomasView()
            .environmentObject(ViewModel(collection: "StThomasData"))
    }
}
