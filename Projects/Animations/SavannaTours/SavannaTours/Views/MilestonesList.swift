//
//  MilestonesList.swift
//  SavannaTours
//
//  Created by vshapovalov on 26.02.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//

import Foundation
import SwiftUI

struct MilestonesList: View {
  var body: some View {
    List((0...4), id: \.self) { num in
      VStack(alignment: .leading) {
        Text("Milestone #\(num+1)")
          .font(.title)
        HStack(alignment: .lastTextBaseline) {
          Text("Savanna National Park (\(num*12 + 5)km)")
            .font(.subheadline)
          Image(systemName: "pin")
          Spacer()
          Text("South Africa")
            .font(.subheadline)
        }
      }
      .padding()
    }
  }
}
