//
//  ReadingForm.swift
//  mc1_app
//
//  Created by Ricky Silitonga on 20/05/22.
//

import SwiftUI

struct ReadingForm: View {
    @Binding var showReadingForm: Bool
    
    @State var bookTitle: String = ""
    @State var bookAuthor: String = ""
    @State var bookTag: [String] = []
    
    @State var addNewTag: Bool = false
    
    var formIsDone: Bool {
        if bookTitle != "" && bookAuthor != "" {
            return true
        } else {
            return false
        }
        
    }
//    self.init(UITableView.appearance().sectionFooterHeight = 0)
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Title..", text: $bookTitle)
                    TextField("Author", text: $bookAuthor)
                }
                
                // category
                Section {
                    VStack(alignment: .leading) {
                        Text("Category")
                            .font(.title3)
                        HStack {
                            TagView(tagText: "Financial", tagColor: .secondary.opacity(0.6))
                            NavigationLink(destination: AddNewCategory()) {
                                Button {
                                    // add new tag
                                    
                                    print("Add new tag")
                                } label: {
                                    HStack(spacing: 0) {
                                        Image(systemName: "plus")
                                        Text("New Category")
                                            .foregroundColor(.blue)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 6)
                                    } .padding(.horizontal, 8)
                                } .background(Capsule().fill(.secondary).opacity(0.6))
                            }
                            
                        }
                    } .padding(.vertical)
                }
                
                
                Section {
                    Button {
                        // add photo
                    } label: {
                        Text("Add Book Cover Image")
                            .font(.body)
                    }
                }
                
            } .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        // cancel button
                        showReadingForm.toggle()
                        
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // Done button
                        if formIsDone {
                            print("baru bisa done setelah title dan author di klik")
                            showReadingForm.toggle()
                        }
                        
                    } label: {
                        Text("Done")
                            .foregroundColor(formIsDone ? .blue : .secondary)
                    }
                }
            }
            .navigationTitle("New List")
            .navigationBarTitleDisplayMode(.inline)
        
        }
    }
}

struct ReadingForm_Previews: PreviewProvider {
    @State static var value: Bool = false
    static var previews: some View {
        ReadingForm(showReadingForm: $value)
    }
}
