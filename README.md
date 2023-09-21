# XcodeGPT
## Xcode Source Editor Extension for OpenAI ChatGPT

XcodeGPT is an open-source Xcode Source Editor Extension that leverages OpenAI's ChatGPT to assist Swift developers with various code-related tasks directly within Xcode. This extension aims to boost your productivity and make your coding experience more efficient.

## Features

### 1. Swift Codable Structs to JSON

Easily generate Swift Codable structs from JSON data. XcodeGPT helps you speed up the process of creating data models for your Swift projects.

### 2. JSON Test Data from Swift Structs

Generate JSON test data directly from your Swift structs. Test your data models with realistic JSON payloads effortlessly.

### 3. Write Documentation for Swift Files

Automate the process of writing documentation for your Swift files. Improve code readability and maintainability with automatically generated comments.

### 4. Analyze Swift Code

Get code analysis suggestions and recommendations to enhance the quality of your Swift code. Identify potential issues and improve code consistency.

### 5. Write Unit Tests

Efficiently generate unit test templates for your Swift code. Speed up the testing process and ensure code reliability.

### 6. Find Bugs

Leverage ChatGPT to help you find potential bugs in your code. Get suggestions on improving code quality and fixing issues.

### 7. Custom ChatGPT Prompts

Interact with ChatGPT using custom prompts tailored to your coding needs. Utilize the power of natural language processing to get code-related assistance.

## Getting Started

Before using XcodeGPT, follow these steps:

1. **API Key Setup**: Obtain an API key from OpenAI and add it to the `apikeys.env` file in the project's root directory. This key is required for making requests to the OpenAI API.

2. **Code Signing Identity**: Ensure that both your App and Xcode extension Targets are properly signed with a valid code signing identity. This step is necessary for the extension to run within Xcode.

## Usage

This Project contains the source code of the Xcode Source Editor Extension that can be built and can run locally. You can explore the features as well as adding new prompts. 
Once the Extension is running, you can access its features by selecting "XcodeGPTEx" from the Editor menu in Xcode. A submenu will appear with options for each of the extension's features.


## Contributing

Contributions to XcodeGPT are welcome! Whether it's bug fixes, new features, or improvements to the documentation, we appreciate your contributions.

## License

XcodeGPT is released under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as per the terms of the license.

---

**Note:** XcodeGPT is an open-source project and not officially affiliated with or endorsed by OpenAI or Apple Inc.