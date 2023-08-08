//
//  PokeDexTests.swift
//  PokeDexTests
//
//  Created by Syed Raza on 8/6/23.
//

import XCTest
@testable import PokeDex
import Combine

enum FileName: String {
    case realDataFile, missingDataFile, emptyDataFile
}
final class PokeDexTests: XCTestCase {
    
   
    
    var cancellables: Set <AnyCancellable> = []
    
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
    
    func test_should_pass_for_real_Data() async throws {
        let viewModel = PokeDexViewModel(service: mockService(fileName: .realDataFile))
        let exp = XCTestExpectation (description: "should pass")
        await viewModel.getPokeDex()
        viewModel.$allPokeDex.dropFirst()
            .sink { pokedex in
                XCTAssertFalse(pokedex.isEmpty, "Expecting to Succeed")
                let first = pokedex.first!
                XCTAssertEqual(first.name, "bulbasaur")
                exp.fulfill()
                
            }
            .store(in: &cancellables)
        await fulfillment(of: [exp], timeout: 5.0)
    }
    

}
class mockService:PokeDexServiceProtocol {
    
    let fileName : FileName
    init(fileName : FileName){
        self.fileName = fileName
    }
    
    func load(_ file:String) -> URL? {
        return Bundle(for: type(of: self)).url(forResource: file, withExtension: "json")
    }
    func fetchPokeDex() async throws -> PokeDexReponse {
        
        guard let url = load (fileName.rawValue) else {throw APIError.invalidUrl}
        let data = try! Data(contentsOf: url)
        
        return try JSONDecoder().decode(PokeDexReponse.self, from: data)
        
    }
}
