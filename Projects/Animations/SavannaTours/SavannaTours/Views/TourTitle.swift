//
//  TourTitle.swift
//  SavannaTours
//
//  Created by vshapovalov on 26.02.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//

import Foundation
import SwiftUI

struct TourTitle: View {
  let title: String
  let caption: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.bold)
        .shadow(radius: 5)
        .foregroundColor(.white)
      
      Text(caption)
        .font(.caption)
        .foregroundColor(.white)
    }
  }
}
