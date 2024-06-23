import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt/cubit/auth_cubit.dart';
import 'package:jwt/cubit/auth_state.dart';
import 'package:jwt/utils/extension.dart';
import 'package:jwt/utils/helper/pager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          TextField(
            controller: loginCubit.controllers['email'],
            decoration: const InputDecoration(
              hintText: "email",
            ),
          ),
          TextField(
            controller: loginCubit.controllers['password'],
            decoration: const InputDecoration(
              hintText: "password",
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("data")),
                );
              } else if (state is AuthSuccess) {
                context.go(Pager.home);
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  loginCubit.login();
                },
                child: state is AuthLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text("login"),
              );
            },
          )
        ],
      ),
    );
  }
}
