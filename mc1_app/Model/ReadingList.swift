//
//  ReadingModel.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 17/05/22.
//

import Foundation


struct ReadingList: Identifiable{
    var id = UUID()
    
    var title: String
    // image
    var image: String
    var purpose: String?
    var highlights: [String]?
    var actionableTakeways: [String]?
}
