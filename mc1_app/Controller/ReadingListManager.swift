//
//  ReadingListManager.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 17/05/22.
//

import Foundation


struct ReadingListManager {
    
    // array of Reading model
    var readingLists: [ReadingListModel] = [
        ReadingListModel(title: "Atomic Habit", image: "atomic_habit", purpose: "Kejahatan adalah nafsu yang terdidik. Kepandaian, seringkali, adalah kelicikan", highlights: [""], actionableTakeways: [""]),
        ReadingListModel(title: "Sapiens", image: "atomic_habit", purpose: "Kejahatan adalah nafsu yang terdidik. Kepandaian, seringkali, adalah kelicikan", highlights: [""], actionableTakeways: [""]),
    ]
    
    
    mutating func addReadingList(data: ReadingListModel) {
        // MARK: add reading list here
        self.readingLists.append(data)
    }
    
    
    func deleteReadingList(index: Int) {
        // MARK: delete reading list data based on index
    }
    
    
}
