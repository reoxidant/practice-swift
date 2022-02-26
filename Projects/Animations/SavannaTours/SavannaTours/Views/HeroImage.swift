//
//  HeroImage.swift
//  SavannaTours
//
//  Created by vshapovalov on 26.02.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//

import Foundation
import SwiftUI

struct HeroImage: View {
  let name: String

  var body: some View {
    Image(name)
      .resizable()
      .edgesIgnoringSafeArea(.top)
      .frame(height: 300)
  }
}
