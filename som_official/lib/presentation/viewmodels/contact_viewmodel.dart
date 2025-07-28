import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:som_official/domain/entities/contact_state.dart';

class ContactViewModel extends StateNotifier<ContactState> {
  ContactViewModel() : super(const ContactState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateMessage(String message) {
    state = state.copyWith(message: message);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  void setSuccess(bool success) {
    state = state.copyWith(isSuccess: success);
  }

  Future<bool> onWillPop(BuildContext context) async {
    if (state.name.isEmpty && state.email.isEmpty && state.message.isEmpty) {
      return true;
    }

    return (await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to go back without submitting?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setLoading(true);
    setError(null);

    try {
      await dotenv.load(fileName: "../../../assets/.env");

      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "service_id": dotenv.env['serviceId'].toString(),
          "template_id": dotenv.env['templateId'].toString(),
          "user_id": dotenv.env['apiKey'].toString(),
          "template_params": {
            "from_name": state.name,
            "from_email": state.email,
            "message": state.message,
          }
        }),
      );

      if (response.statusCode == 200) {
        setSuccess(true);
        _clearForm();
      } else {
        setError('Failed to send message. Please try again.');
      }
    } catch (e) {
      setError(
          'An error occurred. Please check your connection and try again.');
    } finally {
      setLoading(false);
    }
  }

  void _clearForm() {
    nameController.clear();
    emailController.clear();
    messageController.clear();
    state = const ContactState();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Invalid email!';
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.length < 7) {
      return 'Tell a little more about it Please!';
    }
    return null;
  }
}

// Provider
final contactViewModelProvider =
    StateNotifierProvider<ContactViewModel, ContactState>((ref) {
  return ContactViewModel();
});
