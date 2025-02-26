# The Neighbourhood App
The Neighbourhood App makes it easier for people to connect with their local government. It allows citizens to share their concerns, report issues, and stay informed about important updates in their area.

## Table of Contents
1. Introduction  
2. Features  
3. Installation  
4. Usage  
5. Folder Structure  
6. Dependencies
7. App Video

---

## Introduction
The Neighbourhood App makes it easier for people to connect with their local government. It allows citizens to share their concerns, report issues, and stay informed about important updates in their area.
With this app, users can create posts to report problems like potholes, broken streetlights, or garbage collection issues. Whether you want to raise concerns or stay updated on community matters, this app helps you stay connected and informed. 
The app helps users with:

- Read in-depth political articles covering a wide range of topics, including government policies, elections, and community affairs.
- Post and engage in discussions by commenting on articles, sharing insights, and debating issues with other users.
- Stay updated with real-time government news, ensuring that users never miss critical policy updates, announcements, or political events.
- Personalize their experience by customizing notification preferences, selecting topics of interest, and adjusting accessibility settings to meet their needs.
- Connect with local and national political discussions, fostering a sense of civic responsibility and community involvement.

The app offers an intuitive and user-friendly interface, making it easy for both politically engaged citizens and newcomers to navigate and contribute meaningfully to political discourse.

## Features
- Comments
- Post
- Read articles
- Edit settings
- See news of the government

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo.git
   ```
2. Navigate to the project directory:
   ```sh
   cd your-app-folder
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Usage

- Click the filter button so you can see the filter settings. You can't adjust the settings for now but just imagine you did. 
- Click the “find” button. And you should be redirected back to the homepage. 
- On the homepage you can click one of the posts to see more information about that post and you can see what other people have to say about it.  
- Click the back button on the post page so you can get back to the home page or click the home icon in the navigation bar. 
- Finally click the “post” button at the bottom of the screen and you will get redirected to a screen where you can see all the post inputs where you can customize your post. 
- For now, it's just dummy design so imagine that you fill everything in and click the “create” button.  
- If everything is filled in correctly you will go to the post page and see a modal with a confirmation that the post is posted. 
- Click the “close” button of the modal
- Click the “back” button again to finalize this assignment. 

## Folder Structure
```
lib/
 ├── main.dart          # Main entry point
 ├── screens/           # App screens
 ├── widgets/           # Reusable widgets
 └── utils/             # Helper functions
```

## Dependencies
List the main dependencies used in your project with installation instructions.
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  font_awesome_flutter: ^10.7.0
  intl: ^0.19.0
  image_picker: ^1.0.7
  geolocator: ^11.0.0
  provider: ^6.1.0
```

## App Video
Add product video of the app here

