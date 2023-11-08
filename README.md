# Flutter Movie App

https://github.com/Rayyanmaq1/TenTwenty_Task/assets/71687063/ab873ecb-6515-438f-9fd9-56258ad8a2df


This is a Flutter project that utilizes the Movie Database API to display news upcoming movies. The app follows the principles of Clean Architecture and uses BLoC as the state management solution.

## Project Structure

The project is structured as follows:

<img width="269" alt="Screenshot 2023-11-08 at 2 54 54 PM" src="https://github.com/Rayyanmaq1/TenTwenty_Task/assets/71687063/f1edf241-d530-44b4-9c73-de109a364f5e">



## State Management

The app uses the BLoC pattern for state management. Each feature in the `features` directory has its own BLoC for managing the state and business logic. BLoC helps to separate the UI and business logic, making the codebase more maintainable and testable.

## Dependencies

The project uses the following dependencies:

- `flutter_bloc`: For implementing the BLoC pattern and state management.
- `bloc`: The core library for BLoC pattern.
- `equatable`: For simplifying equality comparisons between objects.
- `get_it`: For service locator, providing dependency injection.
- `intl`: For internationalization and formatting dates and numbers.
- `floor`: For local database operations.
- `retrofit`: For making API calls to the News API.
- `flutter_hooks`: For implementing hooks in Flutter.
- `cached_network_image`: For loading and caching images from the web.
- `retrofit_generator`: For generating code for the Retrofit library.
- `floor_generator`: For generating code for the Floor database.
- `build_runner`: For running code generation tasks.
- `dio`: For making HTTP requests and handling network-related tasks.

These dependencies are defined in the `pubspec.yaml` file.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository to your local machine using Git.

```bash
git clone https://github.com/Rayyanmaq1/Local-storage-with-bloc.
```

2. Install the required dependencies by running the following command in the project root directory:

```bash
flutter pub get
```

3. Connect a physical device or use an emulator to run the app:

```bash
Flutter run
```

## Conclusion

Thank you for checking out the Flutter News App! We hope you find it useful and informative. If you have any questions or feedback, feel free to reach out to us. Happy reading!

## Contact

- Email: [rayyanmaq1@gmail.com](mailto:your-email@example.com)

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

We would like to thank [Movie db API](https://developer.themoviedb.org/reference/intro/getting-started) for providing the news data used in this app.

## Further Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Movie Database API Documentation](https://developer.themoviedb.org/reference/intro/getting-started))
- [Flutter Community](https://flutter.dev/community)
- [Awesome Flutter](https://github.com/Solido/awesome-flutter)
