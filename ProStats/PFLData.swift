//
//  PFLData.swift
//  ProStats
//
//  Created by Brady Rhodes on 9/21/22.
//

import SwiftUI

struct TeamData: Hashable, Codable, Identifiable {
    
    var id: String
    var Team: String
    var Record: String
    var totYards: Int
    var pYards: Int
    var rYards: Int
    var totYardsConf: [String:Int]
    var offEffRating: [String:Double]
    var defEffRating: [String:Double]
    
    
}
