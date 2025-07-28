import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:som_official/presentation/viewmodels/contact_viewmodel.dart';
import 'package:som_official/presentation/views/home_view.dart';

import '../../constants/constants.dart';

class ContactFormView extends ConsumerWidget {
  static const String routeName = '/contact-form';
  const ContactFormView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactState = ref.watch(contactViewModelProvider);
    final contactViewModel = ref.read(contactViewModelProvider.notifier);

    return Material(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          final shouldPop = await contactViewModel.onWillPop(context);
          if (shouldPop && context.mounted) {
            Navigator.restorablePopAndPushNamed(context, HomeView.routeName);
          }
        },
        child: Center(
          child: SizedBox(
            width: 400,
            height: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: kCaptionColor, width: 1),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: contactViewModel.formKey,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Contact Form',
                            style: GoogleFonts.oswald(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                          // Show success message
                          if (contactState.isSuccess)
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.green.withValues(alpha: 0.1),
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Message sent successfully!',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          
                          // Show error message
                          if (contactState.error != null)
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: 0.1),
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                contactState.error!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          
                          TextFormField(
                            controller: contactViewModel.nameController,
                            decoration: const InputDecoration(
                              labelText: 'Your Name',
                              focusColor: Colors.white,
                              focusedBorder: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: contactViewModel.updateName,
                            validator: contactViewModel.validateName,
                          ),
                          const SizedBox(height: 10),

                          TextFormField(
                            controller: contactViewModel.emailController,
                            decoration: const InputDecoration(
                              labelText: 'Your E-Mail',
                              focusColor: Colors.white,
                              focusedBorder: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: contactViewModel.updateEmail,
                            validator: contactViewModel.validateEmail,
                          ),
                          const SizedBox(height: 10),

                          TextFormField(
                            controller: contactViewModel.messageController,
                            minLines: 2,
                            maxLines: 10,
                            decoration: const InputDecoration(
                              labelText: 'Your Message for me!',
                              focusColor: Colors.white,
                              focusedBorder: OutlineInputBorder(),
                            ),
                            onChanged: contactViewModel.updateMessage,
                            validator: contactViewModel.validateMessage,
                          ),
                          const SizedBox(height: 20),
                          
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 40),
                              backgroundColor: kPrimaryColor,
                            ),
                            onPressed: contactState.isLoading
                                ? null
                                : contactViewModel.submitForm,
                            child: contactState.isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : const Text(
                                    "Submit",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}