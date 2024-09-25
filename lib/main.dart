import 'package:crud_sample/views/edit_screen.dart';
import 'package:crud_sample/views/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/customer_controller.dart';
import 'firebase_options.dart';
import 'views/add_customers..dart';
import 'views/customer_view.dart';
import 'views/dasboard_screen.dart';
import 'views/intro/intro_screen.dart';
import 'views/login_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CustomerController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Customer App',
        initialRoute: '/intro',
        routes: {
          '/intro': (context) => const IntroScreen(),
          '/login': (context) => const LoginView(),
          '/singUp': (context) => const SignUpView(),
          '/dashboard': (context) => const DashboardView(),
          '/addCustomer': (context) => AddCustomerView(),
          '/viewCustomers': (context) => const ViewCustomersView(),
        },
      ),
    );
  }
}
