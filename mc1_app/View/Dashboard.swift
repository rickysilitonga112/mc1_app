//
//  Dashboard.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 17/05/22.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("Dashboard")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Sort item button pressed")
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // add reading list
                        print("Add reading list pressed")
                    } label: {
                        Text("add")
                    }
                }
            }
        }
        
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
