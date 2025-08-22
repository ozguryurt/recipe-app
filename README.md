# Recipe App 🍳

A beautiful and modern Flutter recipe application that fetches recipes from an external API and displays them with a sleek, user-friendly interface.

## 📸 Screenshots

### Recipe List Screen and Recipe Detail Screen

<p float="left">
  <img src="https://ozguryurt.dev/images/projeler/recipeapp_mobile2.png" width="300" style="margin-right: 10px;" />
  <img src="https://ozguryurt.dev/images/projeler/recipeapp_mobile3.png" width="300" />
</p>

## 📱 Features

### 🏠 Recipe List Screen
- **Recipe Grid View**: Browse all available recipes in an organized list
- **Recipe Cards**: Each recipe displays:
  - High-quality recipe image
  - Recipe name and cuisine type
  - Cooking time and calorie information
  - Star rating
- **Error Handling**: Graceful error messages with retry functionality
- **Loading States**: Smooth loading indicators during API calls

### 📖 Recipe Detail Screen
- **Hero Image**: Stunning full-screen recipe image with collapsible app bar
- **Comprehensive Recipe Info**:
  - Recipe name with beautiful typography
  - Cuisine type and difficulty level
  - Interactive star rating display
  - Review count
- **Quick Stats Dashboard**: Color-coded cards showing:
  - ⏱️ Prep Time (Blue)
  - 🕐 Cook Time (Orange)
  - 🔥 Calories (Red)
  - 👥 Servings (Green)
- **Tags & Categories**: Visual tags for recipe classification
- **Meal Type Indicators**: Breakfast, lunch, dinner classifications
- **Detailed Ingredients**: Numbered list with shopping cart icon
- **Step-by-Step Instructions**: Clear, numbered cooking instructions
- **Modern UI Elements**: Cards, shadows, gradients, and smooth animations

## 🎨 Design Features

- **Modern Material Design**: Clean, contemporary interface
- **Custom Typography**: Poppins font family throughout the app
- **Color-Coded Elements**: Intuitive color system for different information types
- **Custom Icons**: Meaningful icons for better user experience
- **Smooth Animations**: Polished transitions and loading states
- **Dark/Light Theme Support**: Follows system theme preferences

## 🚀 Technology Stack

- **Framework**: Flutter 3.7.0+
- **Language**: Dart
- **Navigation**: GoRouter for declarative routing
- **HTTP Client**: Dart HTTP package for API calls
- **State Management**: StatefulWidget with setState
- **API**: DummyJSON API for recipe data
- **Architecture**: Clean separation with models, services, widgets, and screens

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point and routing configuration
├── models/
│   └── recipe_model.dart        # Recipe data model with JSON parsing
├── screens/
│   ├── recipes_screen.dart      # Main recipe list screen
│   └── recipe_detail_screen.dart # Detailed recipe view
├── services/
│   └── recipe_service.dart      # API service for fetching recipes
├── utils/
│   └── constants.dart          # App constants and configuration
└── widgets/
    ├── error_card.dart         # Reusable error display widget
    ├── recipe_card.dart        # Recipe list item widget
    └── recipes_refresh_card.dart # Refresh recipes widget
```

## 🛠️ Installation & Setup

### Prerequisites
- Flutter SDK (3.7.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android device or emulator / iOS device or simulator

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/ozguryurt/recipe-app.git
   cd recipeapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  go_router: ^16.1.0      # Modern navigation solution
  http: ^1.5.0            # HTTP client for API calls

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0  # Recommended lints for Flutter
```

## 🎯 API Integration

The app integrates with the [DummyJSON Recipes API](https://dummyjson.com/recipes) to fetch:
- Complete recipe list
- Individual recipe details
- Recipe images and metadata

### API Endpoints Used:
- `GET /recipes` - Fetch all recipes
- `GET /recipes/{id}` - Fetch specific recipe details

## 🔄 State Management

The app uses Flutter's built-in state management with:
- `StatefulWidget` for component state
- `setState()` for UI updates
- Proper loading and error state handling
- Lifecycle management with `mounted` checks

## 🎨 UI/UX Highlights

- **Sliver App Bar**: Collapsible header with recipe image
- **Custom Cards**: Elevated cards with rounded corners
- **Color Psychology**: Strategic use of colors for different data types
- **Typography Hierarchy**: Clear information hierarchy with Poppins font
- **Interactive Elements**: Tap animations and visual feedback
- **Error Recovery**: User-friendly error messages with retry options

---

**Made with ❤️ using Flutter**
