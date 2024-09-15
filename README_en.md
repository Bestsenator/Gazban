# Gazban

**Gazban** is a comprehensive project that includes both backend and mobile application components, developed using Django and Flutter. This project is designed for managing individuals who work as gas meter readers. The system provides capabilities for managing areas, registering and tracking leave requests, and sending and managing notifications. Additionally, detailed information about each gas meter reader and their areas of operation is carefully managed.

## Project Structure

This repository includes both the backend and the mobile application. The backend is developed using Django and is responsible for data management and server-side operations. The mobile application is developed using Flutter and allows meter readers to access their information and perform various operations such as leave requests and viewing notifications.

## Features

- **Area Management:** Ability to define and view work areas for each meter reader.
- **Leave Registration and Tracking:** Capability to register leave requests and track their status by meter readers.
- **Notification Management:** Sending and receiving important notifications to meter readers.
- **Flutter Mobile Application:** An application that allows meter readers to easily interact with the backend system and perform necessary operations.
- **Complete Integration in One Repository:** Both backend (Django) and mobile application (Flutter) are included in this repository.

## Models (Tables)

### GasEmployee
The `GasEmployee` class is used to store information about gas meter readers. This class includes personal information, area of operation, and the villages covered by each meter reader. Information related to gas meter reader representatives is also stored in this class.

### Representative
The `Representative` class is used to store information about gas representatives. Each representative includes personal information, national code, contract number, and their area of operation.

### Rescuer
The `Rescuer` class is used to store information about rescuers. Each rescuer has personal information, area code, and user session details.

### HeadCity
The `HeadCity` class is used to manage information about city heads. This class includes personal details of the head and the city and area codes in which they operate.

### HeadRelief
The `HeadRelief` class is used to store information about relief heads. This class includes personal details and the cities covered by the relief head.

### HeadArea
The `HeadArea` class is used to store information about area heads. Each area head has personal information and details about their area of operation.

### DailyRequest
The `DailyRequest` class is used to register and manage daily leave requests of meter readers. Requests include approvals from representatives, delegates, and city or relief heads.

### HourlyRequest
The `HourlyRequest` class is used to register and manage hourly leave requests of meter readers. Hourly requests also require approval from delegates and representatives.

### City
The `City` class is used to store information about cities. Each city includes a unique code, name, and related area.

### Village
The `Village` class is used to store information about villages. Each village is associated with a city and includes the village name and code.

### Announcement
The `Announcement` class is used to register notifications related to various areas. Announcements can have a title, content, priority, and image.

# Backend Section

## Project Dependencies

The following packages are used in this project:

- `Django==5.0.1`
- `django-cors-headers==4.3.0`
- `django-jalali==6.0.1`
- `djangorestframework==3.14.0`
- `jdatetime==5.0.0`

##Installation and Setup

Follow these steps to set up the project:



1. Clone this repository:
   ```bash
   git https://github.com/Bestsenator/Gazban.git
   ```
   
2. Navigate to the project directory:
   ```bash
   cd Web
   ```

3. Create a Python virtual environment:
   ```bash
   python -m venv venv
   ```

4. Activate the virtual environment:

   - On Windows:
     ```bash
     venv\Scripts\activate
     ```
   - on Mac or Linux:
     ```bash
     source venv/bin/activate
     ```

5. Install the project dependencies:
   ```bash
   pip install -r req.txt
   ```

6. Configure the .env file based on the .env.example template.

7. Apply database migrations:
   ```bash
   python manage.py migrate
   ```

8. Run the server:
   ```bash
   python manage.py runserver
   ```

9. The project is now available at http://localhost:8000.

---
# Application Section
## Prerequisites

To run this project, you need to install the following software and tools:

- [Flutter](https://flutter.dev/docs/get-started/install) version 3.0 or higher
- [Dart](https://dart.dev/get-dart) version 3.3 or higher
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) for development

## Project Dependencies

The following packages are used in this project and are defined in the pubspec.yaml file:

## Installation and Setup

To set up the project, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Bestsenator/Gazban.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd app/
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Configure the project settings:**

   **Configure representative and application information:**

   Edit the file static_data.dart located at HamiSho/candidate/lib/Data/static_data.dart and set the following values:

   - Application version
   - Representative code
   - Representative name
   - API Key
   - Server address
   - Representative image

   **Configure the application name:**

   Set the application name in the AndroidManifest.xml file located at HamiSho/candidate/android/app/src/main/AndroidManifest.xml.

   **Configure the application ID:**

   Set the application ID in the build.gradle file located at HamiSho/candidate/android/app/build.gradle.

5. **Run the application:**
   ```bash
   flutter run
   ```

The application should now be available on the emulator or connected device.

## API Endpoints

List of available API endpoints:

- `POST /checkSession/`  
  Check user session status and identify user type.

- `POST /login/`  
  User login using username and password.

- `POST /addRequest/`  
  Add a leave request, either hourly or daily.

- `POST /acceptRequest/`  
  Accept leave requests by the user.

- `POST /getListCharacter/`  
  Get a list of characters based on region code and user type.

- `POST /deleteCharacter/`  
  Delete characters based on specified code.

- `POST /editCharacterInfo/`  
  Edit a character's information based on character type (Gas Employee, Representative, City Head, Relief Head) and related codes.

- `POST /addPerson/`  
  Add a new character to the system based on character type and related information.

- `POST /getMList/`  
  Get a list of employees under the management of a gas employee based on code.

- `POST /getReportRequest/`  
  Get request reports based on specific dates and gas employee code.

- `POST /getLocation/`  
  Get information about villages and cities based on region code.

- `POST /getAnnouncement/`  
  Get announcement information based on region code.

- `POST /addAnnouncement/`  
  Add a new announcement to the system with relevant information such as title, content, priority, and image (optional).
  
Note: The APIs are written using Postman, and the collections are available at [postmanCollection](https://github.com/Bestsenator/Gazban/blob/master/Gazban.postman_collection.json).

## Contribution

If you would like to contribute to this project, you can:

1. Fork this repository.
2. Create a new branch for your feature or bug fix (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push your branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

























