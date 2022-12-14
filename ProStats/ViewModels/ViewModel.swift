//
//  DataManager.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/21/22.
//

import SwiftUI
import Firebase
class ViewModel: ObservableObject {
    @Published var teamDataList = [TeamData]()
    
    var collection: String
    
    init(collection: String) {
            self.collection = collection

        }
    
    func getData() {
        let db = Firestore.firestore()
        
        db.collection(self.collection).getDocuments { snapshot, error in
            
            //Check for errors
            if error == nil {
                //No Errors
                
                if let snapshot = snapshot {
                    
                    //Update the list property in the main thread
                    DispatchQueue.main.async {
                        self.teamDataList = snapshot.documents.map { d in
                            return TeamData(id: d.documentID,
                                            Team: d["Team"] as? String ?? "",
                                            Record: d["Record"] as? String ?? "",
                                            totYards: d["Total Yards"]  as? Int ?? 0,
                                            pYards: d["Pass Yards"] as? Int ?? 0,
                                            rYards: d["Rush Yards"] as? Int ?? 0,
                                            totYardsConf: d["Total Yards Conf"] as? [String:Int] ?? [:],
                                            offEffRating: d["offEffRating"] as? [String:Double] ?? [:],
                                            defEffRating: d["defEffRating"] as? [String:Double] ?? [:]
                            )
                        }
                    }
                }
            }
            else{
                
                
            }
        }
    }
}
