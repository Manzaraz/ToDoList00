//  ToDoListView.swift
//  ToDoList00
//
//  Created by Christian Manzaraz on 05/01/2024.
//

import SwiftUI

struct ToDoListView: View {

    var body: some View {
        NavigationStack {
            
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "eye")
                    Text("Show the New View!")
                }
                .buttonStyle(.borderedProminent)

                
            }
            .padding()
        }
    }
}


#Preview {
    ToDoListView()
}

