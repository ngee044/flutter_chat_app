import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/chat_room_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String chatRoom = '/chatRoom';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.chatRoom:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ChatRoomScreen(
            roomId: args['roomId'],
            roomName: args['roomName'],
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

    }
  }
}