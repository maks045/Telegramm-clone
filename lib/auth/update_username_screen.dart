import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/auth/auth_services.dart';

class UpdateUsernameScreen extends StatefulWidget {
  const UpdateUsernameScreen({super.key});

  @override
  State<UpdateUsernameScreen> createState() => _UpdateUsernameScreenState();
}

class _UpdateUsernameScreenState extends State<UpdateUsernameScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  bool _loading = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    final current = authService.value.currentUser?.displayName ?? '';
    _usernameController.text = current;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _update() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = '';
    });

    try {
      await authService.value.updateUsername(
        username: _usernameController.text.trim(),
      );
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Username updated')));
      Navigator.of(context).maybePop();
    } on FirebaseAuthException catch (e) {
      setState(() => _error = e.message ?? 'Failed to update username');
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
      appBar: AppBar(title: const Text('Update username')),
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
                        'Update username',
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (v) {
                          final value = (v ?? '').trim();
                          if (value.isEmpty) return 'Please enter a username';
                          if (value.length < 3)
                            return 'Username must be at least 3 characters';
                          return null;
                        },
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
                        onPressed: _loading ? null : _update,
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
                                child: Text('Update'),
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
