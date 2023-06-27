Password Manager

This is a simple password manager application built with Flutter and Flask. It allows users to save passwords for different websites locally using a Python backend.
Features

    Save passwords for different websites securely.
    Local storage of passwords using a JSON file.
    User-friendly interface for entering website, username, and password information.
    Real-time feedback on the status of password saving.

Getting Started

To run the Password Manager application, follow the instructions below:
Backend Setup

    Make sure you have Python installed on your machine.
    Install the required Python dependencies by running the following command in the terminal:

    pip install flask

    Open a text editor and create a new file called app.py.
    Copy and paste the Python code provided into the app.py file.
    Save the file.

Frontend Setup

    Make sure you have Flutter and Dart installed on your machine.
    Create a new Flutter project using the Flutter CLI by running the following command in the terminal:

    lua

    flutter create password_manager

    Open the project in your preferred IDE or text editor.
    Replace the contents of the lib/main.dart file in your project with the Dart code provided.
    Save the file.

Running the Application

    Start the Flask backend server by running the following command in the terminal (make sure you are in the same directory as the app.py file):

python app.py

Ensure that the Flask server is running on http://localhost:5000.
Connect your mobile device or emulator to your development environment.
In the terminal, navigate to the root directory of your Flutter project.
Run the following command to launch the application on your connected device:

arduino

    flutter run

Usage

    Launch the Password Manager application on your device or emulator.
    Enter the website, username, and password in the respective input fields.
    Tap the "Save Password" button to save the entered information.
    If the password is saved successfully, a success message will be displayed.
    If there is an error while saving the password, a failure message will be displayed.
    Repeat the process to save passwords for different websites.

Note: The application is currently configured to use a local Flask server running on http://localhost:5000/save-password. Make sure your Flask server is running on the correct URL. You can modify the URL in the Flutter code (savePasswordLocally method) to match your server's address.
Dependencies

    Python Flask: Used to create the backend server for handling password saving requests.
    Flutter: The UI framework used for building the mobile application.
    http package: Used to make HTTP requests to the Flask server.

License

This project is licensed under the MIT License.