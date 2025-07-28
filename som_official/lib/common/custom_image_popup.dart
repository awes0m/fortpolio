import 'dart:ui';

import 'package:flutter/material.dart';

class CustomImagePopup extends StatelessWidget {
  final String imagePath;
  final String title;

  const CustomImagePopup({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          // Blurred Background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withAlpha((0.5 * 255).toInt()),
              ),
            ),
          ),
          // Popup Content
          Positioned(
            top: 50.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  imagePath,
                  height: 90.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text('Image Popup Example')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) => CustomImagePopup(
//                 imageUrl: 'YOUR_IMAGE_URL_HERE',
//                 title: 'Image Title',
//               ),
//             );
//           },
//           child: Text('Open Image Popup'),
//         ),
//       ),
//     ),
//   ));
// }
