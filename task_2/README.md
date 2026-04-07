# 🔐 Advanced Authentication & Onboarding UI Kit

A premium Flutter UI Kit featuring a modern shopping experience for smartwatches. This project showcases advanced authentication flows, category-based product filtering, and interactive product details with dynamic content switching.

---

## 📸 Screenshots

<div style="display: flex; justify-content: space-around; gap: 10px; flex-wrap: wrap;">
  <img src="appScreens/splash.png" width="200" alt="Splash Screen"/>
  <img src="appScreens/onboarding1.png" width="200" alt="Onboarding Screen 1"/>
  <img src="appScreens/onboarding2.png" width="200" alt="Onboarding Screen 2"/>
  <img src="appScreens/onboarding3.png" width="200" alt="Onboarding Screen 3"/>
  <img src="appScreens/login.png" width="200" alt="Login Screen"/>
  <img src="appScreens/signup_without_agree.png" width="200" alt="Signup Screen"/>
  <img src="appScreens/signup_with_agree.png" width="200" alt="Signup Screen"/>
  <img src="appScreens/verify.png" width="200" alt="Verification Screen"/>
  <img src="appScreens/home.png" width="200" alt="Home Screen"/>
  <img src="appScreens/product_detail.png" width="200" alt="Product Detail Screen"/>
</div>

---

## ✨ Features

- **🎠 Smooth Onboarding & Auth** - Professional flow with splash, multi-page onboarding, and secure login/signup.
- **🔍 Smart Category Filtering** - Real-time filtering logic using `where()` to browse products by brand (Apple, Samsung, Amazfit, etc.).
- **📑 Dynamic Product Tabs** - Interactive "Details" vs "Review" switching using conditional rendering.
- **🎨 Custom UI Components** - 
  - **Color Picker**: Interactive watch color selection with active state management.
  - **Custom Buttons**: Standardized button variants for the entire app.
  - **OTP Fields**: Integrated interactive verification UI.
- **📱 Responsive & Scalable** - Built with reusable widgets to adapt to various screen sizes.


---

## 🛠️ Tech Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: StatefulWidget (Core Flutter)
- **UI Components**: Material Design 3


---

## 📁 Project Structure

```
lib/
├── main.dart                          # Application entry point
├── constants/
│   └── app_colors.dart               # Color palette and theme constants
├── models/
    ├── product_model.dart            # Product data model with filtering logic
│   └── onboarding_data.dart          # Data models for onboarding content
├── screens/
│   ├── splash_screen.dart            # Splash/Loading screen
│   ├── onboarding_screen.dart        # Onboarding flow with PageView
│   ├── login_screen.dart             # User login screen
│   ├── signup_screen.dart            # User registration with terms validation
│   ├── verification_screen.dart      # OTP verification screen
    ├── detail_product.dart           # Dynamic product page with tab switching
│   └── home_screen.dart              # Main application home screen
└── widgets/
    ├── custom_button.dart            # Reusable button component
    ├── custom_header.dart            # Reusable header component
    ├── product_card.dart             # Reusable grid card component
    ├── custom_watch_color.dart       # Interactive color selector
    └── custom_textfield.dart         # Reusable text input component


```

---

## 🚀 Getting Started



1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd task_2
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```



---

<div align="center">

**Built with ❤️ using Flutter**

Made with passion for clean UI/UX design and modern authentication flows

</div>
