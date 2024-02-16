import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/presentation/extension/extensions.dart';
import 'package:mkp_ecommerce/presentation/misc/methods.dart';
import 'package:mkp_ecommerce/presentation/providers/router/router_provider.dart';
import 'package:mkp_ecommerce/presentation/providers/user_data/user_data_provider.dart';
import 'package:mkp_ecommerce/presentation/widgets/form/custom_text_form_field.dart';
import 'package:mkp_ecommerce/presentation/widgets/button/primary_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(text: 'johnd');
  final TextEditingController _passwordController =
      TextEditingController(text: 'm38rmF\$');

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      log('userData: prev-$previous, next-$next');
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).go('/main');
        }
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                verticalSpace(150),
                const Center(
                  child: Text(
                    'Login Page',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                verticalSpace(32),
                CustomTextFormField(
                  labelText: 'Username',
                  controller: _usernameController,
                ),
                verticalSpace(24),
                CustomTextFormField(
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                ),
                verticalSpace(48),
                switch (ref.watch(userDataProvider)) {
                  AsyncData(:final value) => value == null
                      ? PrimaryButton(
                          title: 'Login',
                          onPressed: () {
                            if (_usernameController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              ref.read(userDataProvider.notifier).login(
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  );
                            } else {
                              context.showSnackBar('Please fill all fields');
                            }
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    ),
                },
                verticalSpace(48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
