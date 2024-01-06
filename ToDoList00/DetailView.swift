//
//  DetailView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var toDo = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)
    @State private var notes = ""
    @State private var isCompleted = false
    
    var passedValue: String
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    TextField("Enter To Do here.", text: $toDo)
                        .font(.title)
                        .textFieldStyle(.roundedBorder)
                        .padding(.vertical)
        
                    Toggle("Set Reminder:", isOn: $reminderIsOn)
                        .padding(.top)
                    
                    DatePicker("Date:", selection: $dueDate)
                        .padding(.bottom)
                        .disabled(!reminderIsOn)
                    
                    Text("Notes:")
                        .padding(.top)
                    
                    TextField("Notes...", text: $notes, axis: .vertical)
                        .textFieldStyle(.roundedBorder)

                    Toggle("Completed", isOn: $isCompleted)
                        .padding(.top)

                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        //TODO: Add Save code here
                    }
                }
                
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationTitle(passedValue)
        
    }
}

#Preview {
    DetailView(passedValue: "Item 1")
}

