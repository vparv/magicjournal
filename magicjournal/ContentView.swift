//
//  ContentView.swift
//  magicjournal
//
//  Created by Vineet Parvathala on 12/11/24.
//

import SwiftUI
import Inject

struct ContentView: View {
    @ObserveInjection var inject
    @StateObject private var viewModel = JournalViewModel()
    @State private var showingNewEntrySheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.entries) { entry in
                    NavigationLink(destination: JournalEntryDetailView(entry: entry, viewModel: viewModel)) {
                        JournalEntryRow(entry: entry)
                    }
                }
                .onDelete(perform: viewModel.deleteEntry)
            }
            .navigationTitle("My Journal")
            .toolbar {
                Button {
                    showingNewEntrySheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingNewEntrySheet) {
            NewJournalEntryView(viewModel: viewModel)
        }
        .enableInjection()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
