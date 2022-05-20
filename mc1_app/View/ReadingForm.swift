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
    
    
    var formIsDone: Bool {
        if bookTitle != "" && bookAuthor != "" {
            return true
        } else {
            return false
        }
        
    }
//    init() {
//        UITableView.appearance().sectionFooterHeight = 0
//    }
    
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
                            TagView(tagText: "Financial", tagColor: .secondary)
                            TagView(tagText: "Self-Improvement", tagColor: .secondary)
                            
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
            }
            
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
            
        
        }
    }
}

struct ReadingForm_Previews: PreviewProvider {
    @State static var value: Bool = false
    static var previews: some View {
        ReadingForm(showReadingForm: $value)
    }
}
