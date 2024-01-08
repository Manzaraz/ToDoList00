//  ToDoListView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI
import SwiftData

enum SortOption: String, CaseIterable {
    case asEntered = "As Entered"
    case alphabetical = "A-Z"
    case chronological = "Date"
    case completed = "Not Done"
    
    
}

struct SortedToDoList: View {
    @Query var toDos: [ToDo]
    @Environment(\.modelContext) var modelContext
    let sortSelection: SortOption
    
    init(sortSelection: SortOption) {
        self.sortSelection = sortSelection
        switch self.sortSelection {
        case .asEntered:
            _toDos = Query()
        case .alphabetical:
            _toDos = Query(sort: \.item)
        case .chronological:
            _toDos = Query(sort: \.dueDate)
        case .completed:
            _toDos = Query(filter: #Predicate {$0.isCompleted == false})
        }
    }
    
    var body: some View {
        List {
            if toDos.count == 0 {
                Text("Everything is OK, here is nothing \"To Do\". Just Relax 😎")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .padding()
                    .foregroundStyle(.indigo)
            } else {
                ForEach(toDos) { toDo in
                    VStack (alignment: .leading) {
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

                        HStack {
                            Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                                .foregroundStyle(.secondary)
                            if (toDo.reminderIsOn) {
                                Image(systemName: "calendar.badge.clock")
                                    .symbolRenderingMode(.multicolor)
                            }
                        }
                        
                    }
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(toDo)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ToDoListView: View {
    @State private var sheetIsPressented = false
    @State private var sortSelection: SortOption = .asEntered
    
    
    var body: some View {
        NavigationStack {
            SortedToDoList(sortSelection: sortSelection)
                .navigationTitle("To Do List")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            sheetIsPressented.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Picker("", selection: $sortSelection) {
                            ForEach(SortOption.allCases, id: \.self) { sortOrder in
                                Text(sortOrder.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
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


#Preview {
    ToDoListView()
    
}

