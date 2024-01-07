//  ToDoListView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @State private var sheetIsPressented = false
    @Query var toDos: [ToDo]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            List {
                if toDos.count == 0 {
                  Text("Everything is OK, here is nothing \"To Do\". Just Relax 😎")
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.indigo)
                } else {
                    ForEach(toDos) { toDo in
                        HStack {
                            Image(systemName: toDo.isCompleted ?  "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    toDo.isCompleted.toggle()
                                }
                                .foregroundStyle(toDo.isCompleted ? Color.green : Color.gray)
                            
                            NavigationLink {
                                DetailView(toDo: toDo)
                            } label: {
                                Text(toDo.item)
                            }
                        }
                        .font(.title2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(toDo)
                            }
                        }
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPressented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPressented) {
                NavigationStack {
                    DetailView(toDo: ToDo()) // New value
                }
            }        
        }
    }
}


#Preview {
    ToDoListView()
        
}

