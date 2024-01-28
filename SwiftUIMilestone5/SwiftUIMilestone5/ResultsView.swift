//
//  ResultsView.swift
//  SwiftUIMilestone5
//
//  Created by Zachary Adams on 1/27/24.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var rollResultList: RollResults
    var body: some View {
        NavigationStack {
            List(rollResultList.rollResultList, id: \.id) {result in
                Text("\(result.numRolled)")
            }
            .navigationTitle("Previous Results")
        }
    }
}

#Preview {
    ResultsView()
        .environmentObject(RollResults())
}
