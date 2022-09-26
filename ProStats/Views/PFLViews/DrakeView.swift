//
//  DrakeData.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//

import SwiftUI
import Firebase

struct DrakeView: View {
    @ObservedObject var model = ViewModel(collection: "DrakeData")
    
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

struct DrakeView_Previews: PreviewProvider {
    static var previews: some View {
        DrakeView()
            .environmentObject(ViewModel(collection: "DrakeData"))
    }
}
