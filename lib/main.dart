import 'package:firebase_core/firebase_core.dart'; // Importando firebase_core
import 'package:firebase_auth/firebase_auth.dart'; // Importando firebase_auth
import 'package:firebase_analytics/firebase_analytics.dart'; // Importando firebase_analytics
import 'package:flutter/material.dart';
import 'package:myapp/telas/login.dart'; // Tela de login
import 'package:myapp/telas/inicio_tela.dart'; // Tela inicial após login
import 'package:myapp/telas/listas_tela.dart'; // Tela com a lista de itens
import 'package:myapp/telas/chatbot_tela.dart'; // Tela do chat bot

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar o Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDYxbPQsPKS_oq6gl-RTk6AumSPnXllXRA",
      authDomain: "shop-easy-36313.firebaseapp.com",
      projectId: "shop-easy-36313",
      storageBucket: "shop-easy-36313.firebasestorage.app",
      messagingSenderId: "183500587726",
      appId: "1:183500587726:web:4255193c39782806e8469f",
      measurementId: "G-MH0RJ9V70X",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Easy',
      navigatorObservers: [
        FirebaseAnalyticsObserver(
            analytics:
                FirebaseAnalytics.instance), // Configura Firebase Analytics
      ],
      initialRoute: '/', // Defina a rota inicial como a tela de login
      routes: {
        '/': (context) => Login(), // Tela de login
        '/inicio': (context) => InicioTela(), // Tela inicial após login
        '/listas': (context) => ListasTela(), // Tela com as listas de itens
        '/chatbot': (context) => ChatbotTela(), // Tela do chatbot
      },
    );
  }
}
