//
//  RecipeViewModelTests.swift
//  Recipe
//
//  Created by chandresh patel on 05/10/24.
//

import XCTest
@testable import Recipe

class RecipeViewModelTests: XCTestCase {

    var viewModel: RecipeViewModel!
    
    override func setUpWithError() throws {
        super.setUp()
        // Initialize your ViewModel here
        viewModel = RecipeViewModel()
    }

    override func tearDownWithError() throws {
        // Clean up
        viewModel = nil
        super.tearDown()
    }
    
    // Test case for fetching recipes successfully
    func testFetchRecipesSuccess() throws {
        // Create an expectation for an async call
        let expectation = self.expectation(description: "Recipes loaded")
        
        // Call fetchRecipes method in the view model
        viewModel.fetchRecipes()
        
        // Wait for the async call to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            XCTAssertFalse(self.viewModel.recipes.isEmpty, "Recipes should not be empty")
            XCTAssertNil(self.viewModel.errorMessage, "Error message should be nil")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    // Test case for a failed network request or parsing
    func testFetchRecipesFailure() throws {
        // Simulate an error (use a mocked URL or inject a failing dependency)
//        viewModel.recipes = "https://invalid-url.com"
        
        // Call fetchRecipes method in the view model
        viewModel.fetchRecipes()
    }
}
