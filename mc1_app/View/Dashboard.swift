//
//  Dashboard.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 17/05/22.
//

import SwiftUI

struct Dashboard: View {
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                ScrollView {
//                    ZStack {
//                        Rectangle()
//                            .foregroundColor(Color.white)
//
//                        HStack {
//                            Image(systemName: "magnifyingglass")
//                            TextField("Search...",
//                                      text: $searchQuery)
//                        }
//                        .foregroundColor(.gray)
//                        .padding(.horizontal, 20)
//                    }
//
                    
                    VStack(spacing: 20) {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .frame(width: 400, height: 200)
                                .background(.red)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Reading List")
           
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Sort item button pressed")
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            print("Sort item button pressed")
                        } label: {
                            Image(systemName: "arrow.up.arrow.down")
                        }
                        Button {
                            // add reading list
                            print("Add reading list pressed")
                        } label: {
                            Text("add")
                        }
                    }
                }
            }
            .searchable(text: $searchQuery)
        }
        
        
    }
}

struct BookCard: View {
    var body: some View {
        Rectangle()
            .frame(width: .infinity, height: 100)
    }
}


struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}


