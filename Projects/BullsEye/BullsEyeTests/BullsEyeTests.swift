//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by vshapovalov on 06.03.2022.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
  
  var sut: BullsEyeGame!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = BullsEyeGame()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testScoreIsComputedWhenGuessIsHigherThanTarget() {
    
    // given
    let guess = sut.targetValue + 5
    
    // when
    sut.check(guess: guess)
    
    // then
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }
  
  func testScoreIsComputedWhenGuessIsLowerThanTarget() {
    
    //given
    let guess = sut.targetValue - 5
    
    // when
    sut.check(guess: guess)
    
    // then
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }
  
  func testScoreIsComputedPerformance() {
    measure(
      metrics: [
        XCTClockMetric(),
        XCTCPUMetric(),
        XCTStorageMetric(),
        XCTMemoryMetric()
      ]
    ) {
      sut.check(guess: 100)
    }
  }
  
}
