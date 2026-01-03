# Guardian Angel Blueprint

## Overview

Guardian Angel is a personal safety application designed to provide users with a sense of security and immediate access to help in emergency situations. It also fosters a supportive community where users can connect with others who have gone through similar experiences.

## Features

### Core Safety Features

*   **SOS Activation:** A prominent SOS button to quickly trigger an emergency alert.
*   **Countdown Timer:** A 5-second countdown before the SOS is officially sent, allowing for cancellation.
*   **Live Location Sharing:** Automatically shares the user's live location with trusted contacts during an active SOS.
*   **Trusted Contacts:** Users can designate trusted contacts who will be notified in case of an emergency.
*   **SOS History:** A log of all past SOS alerts.
*   **Emergency Settings:** Customizable settings for the SOS feature, such as a silent mode and a personalized SOS message.

### Community Hub

*   **Community Feed:** A social feed where users can share their stories, offer support, and connect with others.
*   **Support Groups:** Themed support groups that users can join to discuss specific topics in a safe and private environment.

### User Profile & Onboarding

*   **Phone Number Authentication:** Secure onboarding using phone number verification.
*   **User Profile:** A personal profile where users can manage their information.
*   **Onboarding Flow:** A simple and intuitive onboarding process to guide new users through the app's features.

## UI/UX Polish

The application will feature a modern and intuitive design with a focus on user experience. The color scheme will be based on a palette of purples and pinks, creating a sense of safety and trust.

### Onboarding Screen

The onboarding process will consist of a series of screens that highlight the key features of the app. Each screen will feature a large image, a title, a brief description, and a list of key features. The final screen will have a "Get Started" button to navigate to the main app.

### Home Screen

The home screen will provide quick access to all the core features of the app. It will feature a large, prominent SOS button at the top, followed by a grid of feature cards. The bottom of the screen will have a navigation bar for easy access to other sections of the app.

## Current Implementation Plan

This is the initial implementation of the Guardian Angel app. All the basic screens and navigation have been set up. The next steps will focus on implementing the core functionalities and connecting the app to a backend service.

### Next Steps:

1.  **Firebase Integration:** Set up Firebase for user authentication, database, and storage.
2.  **Implement User Authentication:** Connect the phone number authentication flow to Firebase Authentication.
3.  **Implement Database:** Use Firestore to store user data, community posts, support groups, and SOS history.
4.  **Implement Storage:** Use Firebase Storage to store user profile pictures.
5.  **Implement Core Functionalities:**
    *   SOS activation logic.
    *   Live location sharing using a location service.
    *   Adding and managing trusted contacts.
    *   Creating and viewing community posts.
    *   Joining and participating in support groups.
