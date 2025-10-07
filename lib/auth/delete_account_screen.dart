import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/auth/auth_services.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;
  String _error = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _deleteAccount() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = '';
    });

    try {
      await authService.value.deleteAccount(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Account deleted')));
      Navigator.of(context).maybePop();
    } on FirebaseAuthException catch (e) {
      setState(() => _error = e.message ?? 'Failed to delete account');
    } catch (_) {
      setState(() => _error = 'Unexpected error');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Delete account')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Delete account',
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'This action is irreversible. To delete your account, please enter your email and password to confirm.',
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _emailController,
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
                          ).hasMatch(value))
                            return 'Enter a valid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (v) =>
                            (v ?? '').isEmpty ? 'Please enter password' : null,
                      ),
                      const SizedBox(height: 12),
                      if (_error.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            _error,
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: _loading ? null : _deleteAccount,
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
                                child: Text('Delete my account'),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
