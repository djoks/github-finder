# GitHub Finder

A Flutter project that allows you to search and explore GitHub repositories.

## Prerequisites

- Flutter 3.13.4
- Dart SDK
- Visual Studio Code or any other IDE with Flutter SDK integration, if you prefer.

## Setup

### Step 1: Clone the Repository

Clone this repository to your local machine.

```bash
git clone https://github.com/your_username/ghfinder.git
```

### Step 2: Install Dependencies

Navigate to your project folder and install all dependencies:

```bash
cd ghfinder
flutter pub get
```

### Step 3: Environment Variables

Rename the `.env.example` file to `.env` within the project directory.

### Step 4: GitHub Personal Access Token

Create a GitHub Personal Access Token to access GitHub's APIs. Follow the instructions [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) to generate a token. Once generated, add it to your `.env` file.

## Running the App

### With Visual Studio Code

Launch configurations are present in `.vscode/launch.json`. You can select the configuration you want to use and start debugging.

### Without Visual Studio Code

To run or build the app, use the following command:

```bash
flutter run --dart-define-from-file=.env
```

Here, `.env` is the path to the `.env` file within the project.

## Build

To build the app, use the following command:

```bash
flutter build --dart-define-from-file=.env
```

## Contributing

Feel free to contribute to this project by creating issues or sending pull requests. Contributions are more than welcome.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

Happy coding!

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
