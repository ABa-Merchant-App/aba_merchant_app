import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/authentication/presentation/manager/login_bloc.dart';
import 'package:merchant_app/features/authentication/presentation/manager/login_event.dart';
import 'package:merchant_app/features/authentication/presentation/manager/login_state.dart';
import 'package:merchant_app/features/cashers/presentation/manager/casher_profile_bloc.dart';
import 'package:merchant_app/features/cashers/presentation/manager/casher_profile_event.dart';
import 'package:merchant_app/features/products/presentation/pages/merchant_product_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
    Widget build(BuildContext context) {
    final usernameField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required for Login";
        }
        if (value.length < 6) {
          return "Password is too short";
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final email = emailController.text;
            final password = passwordController.text;
            context
                .read<LoginBloc>()
                .add(LoginButtonPressed(email: email, password: password));
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minimumSize: Size(MediaQuery.of(context).size.width, 0),
          backgroundColor: Colors.white,
        ),
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Center(
          child: Image.asset(
            'assets/images/appBar.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to this Application',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 25),
                  usernameField,
                  const SizedBox(height: 30),
                  passwordField,
                  const SizedBox(height: 30),
                  loginButton,
                  const SizedBox(height: 20),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:  Text("Something Went Wrong"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const SizedBox(),
                  ),
                  const SizedBox(height: 25),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator(
                          color: Colors.blue,
                        );
                      }
                      if (state is LoginSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            final userName = emailController.text;
                            context
                                .read<CasherProfileBloc>()
                                .add(GetCasherInfoEvent(userName: userName));
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MerchantProductScreen()),
                            );
                          }
                        });
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
