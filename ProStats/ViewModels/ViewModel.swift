//
//  DataManager.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/21/22.
//

import SwiftUI
import Firebase
import Foundation
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
                                            TotYards: d["Total Yards"]  as? Int ?? 0,
                                            pYards: d["Pass Yards"] as? Int ?? 0,
                                            rYards: d["Rush Yards"] as? Int ?? 0,
                                            gOnetot: d["Game 1"] as? [String:Int] ?? [:],
                                            gTwotot: d["Game 2"] as? Int ?? 0,
                                            gThreetot: d["Game 3"] as? Int ?? 0,
                                            gFourtot: d["Game 4"] as? Int ?? 0,
                                            gFivetot: d["Game 5"] as? Int ?? 0,
                                            gSixtot: d["Game 6"] as? Int ?? 0,
                                            gSevtot: d["Game 7"] as? Int ?? 0,
                                            gEighttot: d["Game 8"] as? Int ?? 0
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
