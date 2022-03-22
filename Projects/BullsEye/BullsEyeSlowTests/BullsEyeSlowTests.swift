//
//  BullsEyeSlowTests.swift
//  BullsEyeSlowTests
//
//  Created by vshapovalov on 07.03.2022.
//

import XCTest
@testable import BullsEye

class BullsEyeSlowTests: XCTestCase {
  
  var sut: URLSession!
  let networkMonitor = NetworkMonitor.shared
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = URLSession(configuration: .default)
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  // Asynchronous test: success fast, failure slow
  
  func testValidApiCallGetsHTTPStatusCode200() throws {
    
    try XCTSkipUnless(networkMonitor.isReachable, "Network connectivity needed for this test.")
    
    // given
    let urlString = "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
    let url = URL(string: urlString)!
    
    //1
    let promise = expectation(description: "Status code: 200")
    
    //when
    let dataTask = sut.dataTask(with: url) { _, response, error in
      
      //then
      if let error = error {
        
        XCTFail("Error: \(error.localizedDescription)")
        return
        
      } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
        if statusCode == 200 {
          //2
          promise.fulfill()
        } else {
          XCTFail("Status code: \(statusCode)")
        }
      }
    }
    
    dataTask.resume()
    
    //3
    wait(for: [promise], timeout: 5) // timeout error
  }
  
  func testApiCallCompletes() throws {
    
    try XCTSkipUnless(networkMonitor.isReachable, "Network connectivity needed for this test.")
    
    // given
    let urlString = "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
    let url = URL(string: urlString)!
    let promise = expectation(description: "Completion handler invoked")
    
    var statusCode: Int?
    var responseError: Error?
    
    //when
    let dataTask = sut.dataTask(with: url) {_, response, error in
      statusCode = (response as? HTTPURLResponse)?.statusCode
      responseError = error
      promise.fulfill()
    }
    
    dataTask.resume()
    
    wait(for: [promise], timeout: 5) // always complete
    
    //then
    
    // Error will be here
    XCTAssertNil(responseError)
    XCTAssertEqual(statusCode, 200)
  }
}
