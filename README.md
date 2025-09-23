# alquiler_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Proyecto Flutter - Hackathon Front

Este proyecto está desarrollado en **Flutter** y utiliza **Firebase Authentication** y **Cloud Firestore** para la autenticación de usuarios y manejo de datos y el servicios de Open Payments.

---

## Requisitos Previos

1. Tener instalado **Flutter** en la versión recomendada:

   ```bash
   Flutter 3.32.7 • channel stable • https://github.com/flutter/flutter.git
   Framework • revision d7b523b356 (2025-07-15)
   Engine • revision 39d6d6e699
   Tools • Dart 3.8.1 • DevTools 2.45.1
   ```

2. Contar con una cuenta en **Firebase** y tener habilitados:
   - **Authentication**
   - **Cloud Firestore**

---

## ⚙️ Configuración Inicial

### 1. Configuración del archivo `openpayments`

En el archivo `openpayments.dart`, agrega la URL de tu endpoint:

```dart
static const String _baseUrl = "https://kcdgtprc-3000.usw3.devtunnels.ms/api";
```

---

### 2. Limpieza y Dependencias

Ejecuta los siguientes comandos en la raíz del proyecto:

```bash
flutter clean
flutter pub get
flutter run
```

---

## Integración con Firebase

### Paso 1: Instalar la CLI de Firebase

Si aún no lo hiciste, instala la **Firebase CLI** y accede con tu cuenta de Google:

```bash
firebase login
```

### Paso 2: Instalar la CLI de FlutterFire

```bash
dart pub global activate flutterfire_cli
```

### Paso 3: Configurar Firebase en tu app

Desde el directorio de tu proyecto, ejecuta:

```bash
flutterfire configure
```

Este flujo:
- Conecta tu proyecto de Flutter con Firebase.
- Actualiza la configuración cuando agregues nuevas plataformas o productos de Firebase.
- En Android, agrega automáticamente los complementos de Gradle necesarios.

---

### Paso 4: Inicializar Firebase en tu aplicación

Agrega el paquete principal de Firebase:

```bash
flutter pub add firebase_core
```

Vuelve a ejecutar la configuración:

```bash
flutterfire configure
```

En tu archivo `lib/main.dart`, importa Firebase y las opciones generadas:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

Si deseas usar un proyecto de demostración, puedes inicializar con:

```dart
await Firebase.initializeApp(
  demoProjectId: "demo-project-id",
);
```

---

### Paso 5: Agregar complementos de Firebase

Puedes agregar los plugins necesarios para tu proyecto, por ejemplo:

```bash
flutter pub add firebase_auth
flutter pub add cloud_firestore
```

Vuelve a configurar:

```bash
flutterfire configure
```

---

### Paso 6: Ejecutar el proyecto

Compila y corre la aplicación:

```bash
flutter run
```

---

## Resumen

1. Configura la URL del backend en `openpayments.dart`.  
2. Ejecuta `flutter clean`, `flutter pub get`, y `flutter run`.  
3. Integra tu proyecto con Firebase usando `flutterfire configure`.  
4. Inicializa Firebase en `main.dart`.  
5. Agrega los plugins necesarios (`firebase_auth`, `cloud_firestore`, etc.).  
6. Ejecuta el proyecto con `flutter run`.  

---

## 🛠️ Tecnologías

- **Flutter 3.32.7**
- **Dart 3.8.1**
- **Firebase Authentication**
- **Cloud Firestore**