//
//  ModuleATests.swift
//  ModuleATests
//
//  Created by Mohamad Basuony on 01/05/2024.
//

import XCTest
@testable import ModuleA

final class ModuleATests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testNetworkCall() throws{
        let expectation = XCTestExpectation()
        var repo : UniversitiesListRepoProtocol
        repo = UniversitiesListRepo()
        
        repo.getUniversities { result in
            switch result {
            case let .success(model) :
                // Testing For UAE Count
                XCTAssertEqual(model.count == 37, true)
//                if model.count == 37 {
                       expectation.fulfill()
//                   }
            case let .failure(error) :
                XCTFail(error?.localizedDescription ?? "")
                expectation.fulfill()

            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
