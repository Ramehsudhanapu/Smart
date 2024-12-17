import 'package:flutter/material.dart';

import 'base_view_ model.dart';


class PasswordViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _password = '';
  String _errorMessage = '';
  String? _successMessage;

  bool _isPasswordVisible = false;

  // Getters
  String get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;
  bool get isPasswordVisible => _isPasswordVisible;

  // New password validation message getter
  String? get passwordValidationMessage => _errorMessage.isNotEmpty ? _errorMessage : null;

  void setPassword(String password) {
    _password = password;
    validatePassword();
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setSuccessMessage(String message) {
    _successMessage = message;
    _errorMessage = '';
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  // Password Validation Logic
  bool validatePassword() {
    if (_password.isEmpty) {
      setErrorMessage('Password cannot be empty.');
      return false;
    } else if (_password.length < 6) {
      setErrorMessage('Password must be at least 6 characters long.');
      return false;
    }
    setErrorMessage(''); // Clear any previous error
    return true;
  }

  Future<void> submitPassword() async {
    setLoading(true);
    if (!validatePassword()) {
      setLoading(false);
      return;
    }

    try {
      // Simulating API call or password verification logic
      await Future.delayed(Duration(seconds: 2));
      setSuccessMessage('Password validated successfully!');
    } catch (e) {
      setErrorMessage('An error occurred. Please try again.');
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
