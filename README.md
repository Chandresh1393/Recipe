
# Recipe App

## Steps to Run the App

1. **Clone the Repository**:
   - Clone the repository to your local machine using the following command:
     ```bash
     git clone https://github.com/Chandresh1393/Recipe.git
     ```

2. **Open the Project**:
   - Navigate to the project directory and open the `.xcodeproj` file using Xcode:
     ```bash
     cd recipe-app
     open RecipeApp.xcodeproj
     ```

3. **Install Dependencies**:
   - If you are using external dependencies like **Kingfisher** for image caching, ensure you install them via **Swift Package Manager** in Xcode. You can do this by navigating to **File > Swift Packages > Add Package Dependency**, and add the necessary package URLs.

4. **Run the App**:
   - In Xcode, select the target simulator or a connected device.
   - Press **Cmd + R** to run the app.

5. **Running Tests**:
   - You can run the unit tests by selecting **Product > Test** from the Xcode menu or pressing **Cmd + U**.

---

## Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

1. **Architecture (MVVM)**: I focused on setting up a scalable and maintainable architecture by implementing the MVVM pattern. This helps separate business logic from UI components, ensuring code remains organized and testable.
2. **Concurrency and Networking**: Efficient data fetching was a key focus. I used **GCD (Grand Central Dispatch)** to manage background tasks and ensure smooth performance when retrieving recipes from the API.
3. **Error Handling**: I paid close attention to how errors are handled during API calls and data parsing, particularly malformed and empty data responses.
4. **Performance (Image Caching)**: I focused on reducing unnecessary bandwidth consumption by caching images using **Kingfisher**, which provides disk-based image caching out-of-the-box.
5. **Unit Testing**: I prioritized unit testing for the ViewModel, ensuring that both successful and erroneous cases were covered, including malformed and empty data scenarios.

---

## Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

- **Project Setup**: ~10 Mins
- **Networking and API Integration**: ~30 Mins
- **MVVM Implementation**: ~30 Mins
- **Error Handling**: ~30 Mins
- **UI Development (SwiftUI)**: ~30 Mins
- **Image Caching (Kingfisher Integration)**: ~10 Mins
- **Unit Testing**: ~45 Mins
- **Bug Fixes & Fine-tuning**: ~15 Mins

Total: **~3.5 hours**

---

## Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

- **UI/UX Simplicity**: I kept the user interface relatively simple with just one screen to focus on the core functionality and architecture. A more complex UI could have been added, but I prioritized backend performance and network efficiency over extensive UI elements.
- **Image Library**: I chose **Kingfisher** for image caching instead of implementing a custom solution. This decision saved time and ensured reliable performance, but it adds an external dependency to the project.

---

## Weakest Part of the Project: What do you think is the weakest part of your project?

Yes, I need to more work with TestCases. I am more working with test cases.

---

## External Code and Dependencies: Did you use any external code, libraries, or dependencies?

- **Kingfisher**: Used for image downloading and caching, which helps improve app performance by caching images on disk and reducing repeated network requests.
  - [Kingfisher GitHub](https://github.com/onevcat/Kingfisher)

---

## Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
- **Testing Focus**: While I wrote comprehensive unit tests for the ViewModel, no UI or integration tests were included. UI tests could be implemented in the future for complete coverage.
