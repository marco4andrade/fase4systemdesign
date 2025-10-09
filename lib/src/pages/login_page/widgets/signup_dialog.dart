import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';
import '../validators/login_validators.dart';
import '../styles/login_page_styles.dart';

class SignUpData {
  const SignUpData({
    required this.username,
    required this.email,
    required this.password,
  });
  final String username;
  final String email;
  final String password;
}

typedef OnSignUpSubmit = void Function(SignUpData data);

class SignUpDialog extends StatefulWidget {
  const SignUpDialog({super.key, required this.onSubmit});

  final OnSignUpSubmit onSubmit;

  @override
  State<SignUpDialog> createState() => _SignUpDialogState();
}

class _SignUpDialogState extends State<SignUpDialog> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _loading = true);
    widget.onSubmit(
      SignUpData(
        username: _usernameCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      ),
    );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(LoginPageStyles.mainPadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Pragma4Text('Crear cuenta', variant: Pragma4TextType.titleLarge),
              const SizedBox(height: 16),
              Pragma4InputField(
                controller: _usernameCtrl,
                labelText: 'Nombre de usuario',
                hintText: 'Tu usuario',
                validator: LoginValidators.usernameValidator,
              ),
              const SizedBox(height: 12),
              Pragma4InputField(
                controller: _emailCtrl,
                labelText: 'Correo',
                hintText: 'tu@correo.com',
                validator: LoginValidators.emailValidator,
              ),
              const SizedBox(height: 12),
              Pragma4InputField(
                controller: _passwordCtrl,
                labelText: 'Contraseña',
                hintText: 'Mínimo 6 caracteres',
                obscureText: _obscure,
                suffixIcon: IconButton(
                  icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
                validator: LoginValidators.passwordValidator,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _loading ? null : () => Navigator.of(context).pop(),
                    child: Pragma4Text('Cancelar', variant: Pragma4TextType.bodyMedium),
                  ),
                  const SizedBox(width: 8),
                  Pragma4Button(
                    text: 'Registrar',
                    onPressed: _loading ? null : _submit,
                    isLoading: _loading,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
