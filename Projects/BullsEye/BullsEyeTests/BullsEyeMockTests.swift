//
//  BullsEyeMockTests.swift
//  BullsEyeSlowTests
//
//  Created by vshapovalov on 07.03.2022.
//

import XCTest
@testable import BullsEye

class MockUserDefaults: UserDefaults {
  var gameStyleChanged = 0
  
  override func set(_ value: Int, forKey defaultName: String) {
    if defaultName == "gameStyle" {
      gameStyleChanged += 1
    }
  }
}

class BullsEyeMockTests: XCTestCase {
  
  var sut: ViewController!
  var mockUserDefaults: MockUserDefaults!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController
    mockUserDefaults = MockUserDefaults(suiteName: "testing")
    sut.defaults = mockUserDefaults
  }
  
  override func tearDownWithError() throws {
    sut = nil
    mockUserDefaults = nil
    try super.tearDownWithError()
  }
  
  func testGameStyleCanBeChanged() {
    // given
    
    let segmentControl = UISegmentedControl()
    
    // when
    XCTAssertEqual(mockUserDefaults.gameStyleChanged, 0, "gameStyleChanged should be 0 before sendActions")
    
    segmentControl.addTarget(sut, action: #selector(ViewController.chooseGameStyle(_:)), for: .valueChanged)
    
    segmentControl.sendActions(for: .valueChanged)
    
    //then
    
    XCTAssertEqual(mockUserDefaults.gameStyleChanged, 1, "gameStyle user default wasn't changed")
  }
  
}
