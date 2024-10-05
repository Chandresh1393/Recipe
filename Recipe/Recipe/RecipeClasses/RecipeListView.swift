//
//  RecipeListView.swift
//  Recipe
//
//  Created by chandresh patel on 05/10/24.
//

import SwiftUI
import Kingfisher

struct RecipeListView: View {
    @StateObject var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading recipes...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
            } else if viewModel.recipes.isEmpty {
                Text("No recipes available")
            } else {
                List(viewModel.recipes) { recipe in
                    RecipeRow(recipe: recipe)
                }
                .navigationTitle("Recipes")
                .refreshable {
                    viewModel.fetchRecipes()
                }
            }
        }
        .onAppear {
            viewModel.fetchRecipes()
        }
    }
}

struct RecipeRow: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            KFImage(URL(string: recipe.photoURLSmall ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

