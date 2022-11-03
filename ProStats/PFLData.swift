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
    var TotYards: Int
    var pYards: Int
    var rYards: Int
    var gOnetot: [String:Int]
    var gTwotot: Int
    var gThreetot: Int
    var gFourtot: Int
    var gFivetot: Int
    var gSixtot: Int
    var gSevtot: Int
    var gEighttot: Int
    
    
}
