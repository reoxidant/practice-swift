//
//  BullsEyeFakeTests.swift
//  BullsEyeTests
//
//  Created by vshapovalov on 07.03.2022.
//

import XCTest
@testable import BullsEye

class BullsEyeFakeTests: XCTestCase {
  
  var sut: BullsEyeGame!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = BullsEyeGame()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testStartNewRoundUsesRandomValueFromApiRequests() {
    // given
    
    // 1
    let stubbedData = "[1]".data(using: .utf8)
    let urlString = "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
    let url = URL(string: urlString)!
    
    let stubbedResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
    let urlSessionStub = URLSessionStub(data: stubbedData, response: stubbedResponse, error: nil)
    
    sut.urlSession = urlSessionStub
    
    let promise = expectation(description: "Value Received")
    
    // when
    
    sut.startNewRound {
      // then
      
      // 2
      XCTAssertEqual(self.sut.targetValue, 1)
      
      promise.fulfill()
    }
    
    wait(for: [promise], timeout: 5)
  }
}
