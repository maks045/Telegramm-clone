import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/services/auth/auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirm = TextEditingController();
  // TextEditingController controllerName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMeassage = '';
  bool _loading = false;
  bool _obscure = true;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConfirm.dispose();
    // controllerName.dispose();
    super.dispose();
  }

  void register() async {
    if (!formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      errorMeassage = '';
    });
    try {
      await authService.value.createAccount(
        // name: controllerName.text,
        email: controllerEmail.text.trim(),
        password: controllerPassword.text,
      );
      popPage();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMeassage = e.message ?? '';
      });
    } catch (_) {
      setState(() {
        errorMeassage = 'Unexpected error';
      });
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: const Text('Register')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width =
              constraints.maxWidth > 600 ? 480.0 : constraints.maxWidth * 0.92;
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: SizedBox(
                width: width,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Create account',
                            style: theme.textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Register with email and password',
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (v) {
                              final value = v ?? '';
                              if (value.isEmpty) return 'Please enter email';
                              if (!RegExp(
                                r"^[^@\s]+@[^@\s]+\.[^@\s]+$",
                              ).hasMatch(value)) return 'Enter a valid email';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: controllerPassword,
                            obscureText: _obscure,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () =>
                                    setState(() => _obscure = !_obscure),
                              ),
                            ),
                            validator: (v) {
                              final value = v ?? '';
                              if (value.isEmpty) return 'Please enter password';
                              if (value.length < 6)
                                return 'Password must be at least 6 characters';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: controllerConfirm,
                            obscureText: _obscure,
                            decoration: const InputDecoration(
                              labelText: 'Confirm password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            validator: (v) {
                              final value = v ?? '';
                              if (value.isEmpty)
                                return 'Please confirm password';
                              if (value != controllerPassword.text)
                                return 'Passwords do not match';
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          if (errorMeassage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                errorMeassage,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: theme.colorScheme.error,
                                ),
                              ),
                            ),
                          ElevatedButton(
                            onPressed: _loading ? null : register,
                            child: _loading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Text('Create account'),
                                  ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?'),
                              TextButton(
                                onPressed: () => Navigator.pushReplacementNamed(
                                  context,
                                  '/login',
                                ),
                                child: const Text('Sign in'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
