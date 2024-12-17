import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/password_view_model.dart';

class PasswordScreen extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PasswordViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<PasswordViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),

                    // Password Input Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !viewModel.isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: viewModel.togglePasswordVisibility,
                        ),
                      ),
                      onChanged: (password) {
                        viewModel.setPassword(password);
                      },
                    ),
                    SizedBox(height: 10),

                    // Display password validation message
                    if (viewModel.passwordValidationMessage != null)
                      Text(
                        viewModel.passwordValidationMessage!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    SizedBox(height: 30),

                    // Login Button
                    ElevatedButton(
                      onPressed: viewModel.isLoading
                          ? null
                          : () async {
                        //await viewModel.login();
                        if (viewModel.successMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(viewModel.successMessage!),
                              backgroundColor: Colors.green,
                            ),
                          );
                          // Navigate to next screen if needed
                        } else if (viewModel.errorMessage.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(viewModel.errorMessage),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: viewModel.isLoading
                          ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
