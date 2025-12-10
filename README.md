# FoodPlease+ 🍔

FoodPlease+ is a multi-platform Flutter application designed to streamline the food ordering and delivery process. It features a unique "sketchy" hand-drawn aesthetic and robust role-based functionality for Clients, Restaurant Owners, and Delivery Drivers.

## Features ✨

*   **Role-Based Access Control**: Secure login and distinct interfaces for three user roles:
    *   **Client**: Browse the menu, add items to the cart, place orders, and track order status in real-time.
    *   **Owner**: Monitor the business dashboard, manage the product catalog (add/edit items), and oversee operations.
    *   **Delivery**: View assigned orders and update delivery statuses (Pending, On the Way, Delivered).
*   **Unique Design**: Features a distinct hand-drawn UI style using the *Patrick Hand* font and a custom color palette (Creamy Paper background, Vibrant Red & Teal accents).
*   **State Management**: efficient state management using `Provider` for seamless data flow across the app.
*   **Cross-Platform**: Built with Flutter to run on Mobile (iOS/Android), Web, and Desktop.

## Tech Stack 🛠️

*   **Framework**: Flutter
*   **Language**: Dart
*   **State Management**: Provider
*   **Fonts**: Google Fonts (Patrick Hand)
*   **Icons**: Cupertino Icons & Material Icons

## Getting Started 🚀

Follow these steps to get the project running on your local machine.

### Prerequisites

*   [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
*   An IDE (VS Code, Android Studio, etc.) configured for Flutter development.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/food_please.git
    cd food_please
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```

## Project Structure 📂

*   `lib/main.dart`: Entry point of the application.
*   `lib/providers/`: Contains state management logic (Auth, Cart, Data).
*   `lib/screens/`: UI screens organized by feature/role.
    *   `client/`: Client-facing screens (Home, Cart, Checkout).
    *   `owner/`: Management screens (Dashboard, Product Management).
    *   `delivery/`: Delivery driver interfaces.
    *   `login_screen.dart`, `register_screen.dart`, `welcome_screen.dart`: Authentication and onboarding.

## Contributions

Contributions are welcome! Please feel free to submit a Pull Request.
