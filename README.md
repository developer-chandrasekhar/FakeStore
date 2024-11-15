# FakeStore 📱
The FakeStore app is a modern SwiftUI application built with a focus on maintainability, testability, scalability, simplicity, and performance. By leveraging Clean Architecture and MVVM principles, the project ensures a well-structured and modular codebase that enhances code reusability and separation of concerns.
## Coding Standards
- **Multi-Module Architecture:** Designed with a modular project structure to ensure better separation of responsibilities, enhanced build times, and improved scalability.
- **SwiftUI:** Utilises the latest declarative UI toolkit for iOS, enabling the development of responsive, beautiful, fast, and reusable UIs.
- **Swift:** The primary programming language used for development, ensuring modern, safe, and performance-focused code.
- **Async Programming:** Utilises `async/await` for improved concurrency, ensuring responsive and efficient task handling.
- **KFImage:** Leverages the KIngFisher Image to efficiently load images from remote sources, enhancing user experience with seamless image handling with effective cacheing.
- **Unit Testing:** Ensures comprehensive code coverage and reliability through structured testing.
- **UI Testing:** Provides robust testing to validate user interface interactions and maintain application stability.
## Networking
- Used Local Swift Package Manager to separate network-related code for better modularization and maintainability.
## APP Features
- Display a list of products.
- Show detailed product information.
- Implement a dummy add-to-cart functionality with a success alert.
- Handle various view states such as no network, no products, loading, and error states.
### Project Structure

#### [`Data Module `](/FakeStore/FakeStore/Data)

Manages application data, including remote sources, and relies on the domain layer for contracts. Tests for the Repositories are implemented here.

#### [`Domain Module `](FakeStore/FakeStore/Domain)

Contains business logic, including repositories, models, and use cases. Tests for use cases are conducted in this layer.

#### [`Presentation Module `](FakeStore/FakeStore/Presentation)

Includes screens and their ViewModels, following the MVVM pattern. Uses separate data models for the presentation layer, distinct from domain models.

Here's a breakdown of the module dependencies:
- `app` depends on `data`, `domain`, `presentation`.
- `presentation` depends on `domain`,`data`.
- `data` depends on `domain`.

### Testing
- Tested the Product Repositories in the data layer.
- Validated the use cases in the domain layer.
- Conducted tests on the view models in the presentation layer.
- Performed UI tests in the presentation layer.

## How to Run the Project

- Clone the Repository:
```
git clone https://github.com/developer-chandrasekhar/FakeStore.git
```
### Screenshots
<p>
  <img alt="screenshot1" src="https://github.com/developer-chandrasekhar/develop-sample-images/blob/main/fakeStore_1.png?raw=true" width="300"> 
  <img alt="screenshot2" src="https://github.com/developer-chandrasekhar/develop-sample-images/blob/main/FakeStore_2.png?raw=true" width="300"><br>
  <img alt="screenshot3" src="https://github.com/developer-chandrasekhar/develop-sample-images/blob/main/FakeStore_3.png?raw=true" width="300">
  <img alt="screenshot4" src="https://github.com/developer-chandrasekhar/develop-sample-images/blob/main/FakeStore_4.png?raw=true" width="300">
</p> 

## MIT License

Copyright (c) 2024 developer-chandrasekhar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

