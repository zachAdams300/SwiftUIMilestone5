//
//  ContentView.swift
//  SwiftUIMilestone5
//
//  Created by Zachary Adams on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var rollResultList = RollResults()
    var body: some View {
        TabView {
            RollDiceView()
                .tabItem {
                    Label("Role Dice", systemImage: "tray.and.arrow.up.fill")
                }
            
            ResultsView()
                .tabItem {
                    Label("Role Results", systemImage: "tray.and.arrow.up.fill")
                }
        }
        .environmentObject(rollResultList)
    }
}

#Preview {
    ContentView()
}
