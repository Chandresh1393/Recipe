//
//  RecipeViewModel.swift
//  Recipe
//
//  Created by chandresh patel on 05/10/24.
//

import Foundation

import Foundation

// ViewModel
class RecipeViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let recipeURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"

    // Function to fetch recipes
    func fetchRecipes() {
        guard let url = URL(string: recipeURL) else {
            errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        // Make the API call
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = "Network error: \(error.localizedDescription)"
                    return
                }
                guard let data = data else {
                    self.errorMessage = "No data received"
                    return
                }
                do {
                    // Decode the JSON into the RecipeList model
                    let decodedData = try JSONDecoder().decode(RecipeList.self, from: data)
                    self.recipes = decodedData.recipes
                } catch let decodingError as DecodingError {
                    // Handle specific decoding errors for better insight
                    switch decodingError {
                    case .typeMismatch(let type, let context):
                        self.errorMessage = "Type mismatch error: \(type). \(context.debugDescription)"
                    case .valueNotFound(let value, let context):
                        self.errorMessage = "Value not found for \(value). \(context.debugDescription)"
                    case .keyNotFound(let key, let context):
                        self.errorMessage = "Key \(key.stringValue) not found: \(context.debugDescription)"
                    case .dataCorrupted(let context):
                        self.errorMessage = "Data corrupted: \(context.debugDescription)"
                    default:
                        self.errorMessage = "Decoding error: \(decodingError.localizedDescription)"
                    }
                } catch {
                    // Catch any other errors
                    self.errorMessage = "Unexpected error: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
