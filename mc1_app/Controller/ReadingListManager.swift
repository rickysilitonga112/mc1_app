//
//  ReadingListManager.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 17/05/22.
//

import Foundation


struct ReadingListManager {
    
    // array of Reading model
    var readingLists: [ReadingListModel] = []
    
    
    mutating func addReadingList(data: ReadingListModel) {
        // MARK: add reading list here
        self.readingLists.append(data)
    }
    
    
    mutating func deleteReadingList(index: Int) {
        // MARK: delete reading list data based on index
        self.readingLists.remove(at: index)
    }
    
    
}
