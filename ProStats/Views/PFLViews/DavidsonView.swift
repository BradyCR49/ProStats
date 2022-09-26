//
//  DavidsonView.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/25/22.
//
import SwiftUI
import Firebase

struct DavidsonView: View {
    @ObservedObject var model = ViewModel(collection: "DavidsonData")
    
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

struct DavidsonView_Previews: PreviewProvider {
    static var previews: some View {
        DavidsonView()
            .environmentObject(ViewModel(collection: "DavidsonData"))
    }
}
