import 'package:flutter/material.dart';
import 'package:merchant_app/core/routes.dart';
import 'package:merchant_app/features/cashers/presentation/manager/casher_profile_bloc.dart';
import 'package:merchant_app/features/menu/presentation/manager/menu_bloc.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_bloc.dart';
import 'package:merchant_app/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/authentication/presentation/manager/login_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_localizations/flutter_localizations.dart'; 
import 'package:merchant_app/l10n/app_localizations.dart'; // Generated localization file

// Define the GlobalKey for MyApp state
//final GlobalKey<_MyAppState> myAppKey = GlobalKey<_MyAppState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  try {
    await dotenv.load(fileName: ".env");  // Ensure the correct file path
  } catch (e) { // Print any error
  }

  final GlobalKey<MyAppState> myAppKey = GlobalKey<MyAppState>();
  runApp(MyApp(key: myAppKey)); // Pass the key to MyApp
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // Variable to hold the selected locale
  Locale _locale = const Locale('en', '');

  // Method to update the locale
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => sl<LoginBloc>()),
        BlocProvider<MerchantProductBloc>(create: (_) => sl<MerchantProductBloc>()),
        BlocProvider<CasherProfileBloc>(create: (_) => sl<CasherProfileBloc>()),
        BlocProvider<MenuBloc>(create: (_) => sl<MenuBloc>()),
      ],
      child: MaterialApp(
        title: 'Merchant App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.flash,
        routes: AppRoutes.routes,

        // Localization delegates for supporting multiple languages
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
           AppLocalizationsDelegate(), // Your localization delegate
        ],
        supportedLocales:const  [
          Locale('en', ''), // English
          Locale('am', ''), // Amharic
        ],
        // Dynamically set locale
        locale: _locale,
      ),
    );
  }
}
