//
//  DetailView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo: ToDo

    
    var body: some View {
        
        List {
            TextField("Enter To Do here...", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                .listRowSeparator(.hidden)
                .padding(.top)
            
            DatePicker("Date:", selection: $toDo.dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
            
            Text("Notes:")
                .listRowSeparator(.hidden)
                .padding(.top)
            
            TextField("Notes...", text: $toDo.notes, axis: .vertical)
                .listRowSeparator(.hidden)
                .textFieldStyle(.roundedBorder)
            
            Toggle("Completed", isOn: $toDo.isCompleted)
                .padding(.top)
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
                    toDosVM.saveToDo(toDo: toDo)
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DetailView(toDo: ToDo())
            .environmentObject(ToDosViewModel())
    }
}

