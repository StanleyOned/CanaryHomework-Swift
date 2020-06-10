# CanaryHomework-Swift

### Setup

The project doesn't depend on any third party libraries to compile, you can run the project by opening the CanaryHomework-Swift.xcodeproj file in Xcode and pressing the play button.

### Architecture

The architecture of the application follows the [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) pattern combine with [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) delegation pattern. These architecture make it easy to test your code and also takes into account separation of concerns within the project, ideally for readability, reachability and, scalability.

The project [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) implementation will be located in the `Features/Devices` folder. There you will find the DevicesViewController, DevicesView, DevicesViewModel and, its protocol.

The **DevicesViewModel** uses its dependency `DevicesProvider` to fetch all the devices's related request from the Devices API endpoint. When the Device model gets decoded the **DevicesViewModel** signals the **DevicesView** to reload the views data so it can be displayed. **DevicesView** communicates to **DevicesViewModel** when the user taps on one of the cells, it signals the **DevicesViewModel** to do the business logic for it and then routes to the **DevicesDetailViewController** screen.

### Theme

The project has an implementation of a basic `Theme` class which has all the `TextStyle` and `Color` of the application.

### Code Style Guidelines

All the files in this project follow a code style that is used to keep the code clean and precise with keeping in mind scalability in the application. All public functions are documented, if the documentation for the class or public functions is not in the file class then its documentation will be located in the class protocol. Every file is organized using `MARK` which is used as follow:

1. Public Properties
2. Private Properties
3. Initializer
4. Views Life cycle
5. Public Functions
6. Private Functions

### Testing

Most of the project main functionalities are fully tested using Unit Testing. Inside the CanaryHomework-SwiftTests folder, you will find the Unit Test. There you will find tests for all Device feature.

### Extra Features

The project supports Dark Mode. You can test the functionality by toggling the `Dark/light` mode in your device Settings application.

### Author

Stanle De la Cruz

