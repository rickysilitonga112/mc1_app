//
//  TagView.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 20/05/22.
//

import Foundation
import SwiftUI

struct TagView: View {
    let tagText: String
    let tagColor: Color
    
    var body: some View {
        Text(tagText)
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Capsule().fill(tagColor))
    }
}
