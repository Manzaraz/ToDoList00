//
//  ToDoList00App.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI
import SwiftData

@main
struct ToDoList00App: App {
    
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self) //MARK: Fijate si va aquí o lo cargo al ToDoListView()
        }
    }
}
