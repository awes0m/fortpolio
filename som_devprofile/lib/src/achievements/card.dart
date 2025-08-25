import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../html_open_link.dart';
import '../../theme/config.dart';

class AchievementsCard extends StatefulWidget {
  const AchievementsCard({
    Key? key,
    required this.desc,
    required this.isMobile,
    required this.link,
    this.imagePath,
    this.showImageDialog = false,
  }) : super(key: key);

  final String desc, link;
  final bool isMobile;
  final String? imagePath;
  final bool showImageDialog;
  
  @override
  State<AchievementsCard> createState() => _AchievementsCardState();
}

class _AchievementsCardState extends State<AchievementsCard> {
  bool isHover = false;

  void _showCertificateDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: InteractiveViewer(
                    panEnabled: true,
                    boundaryMargin: const EdgeInsets.all(20),
                    minScale: 0.5,
                    maxScale: 3.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: widget.imagePath != null
                          ? Image.asset(
                              widget.imagePath!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.image_not_supported,
                                        size: 64,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Certificate image not available',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () => htmlOpenLink(widget.link),
                                        child: const Text('View Online'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text('No image available'),
                            ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.open_in_new, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                        htmlOpenLink(widget.link);
                      },
                      tooltip: 'View Original',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isHover ? Colors.black12 : Colors.black45,
            blurRadius: 10.0,
            offset: const Offset(8, 12),
          )
        ],
      ),
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
          top: isHover ? height * 0.005 : height * 0.01,
          bottom: !isHover ? height * 0.005 : height * 0.01),
      child: InkWell(
        onHover: (bool value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () => widget.showImageDialog && widget.imagePath != null
            ? _showCertificateDialog(context)
            : htmlOpenLink(widget.link),
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
              top: height * 0.04,
              left: width * 0.015,
              right: width * 0.015,
              bottom: height * 0.04),
          width: !widget.isMobile ? width * 0.28 : width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHover ? Colors.black12 : Colors.black45,
                blurRadius: 10.0,
                offset: const Offset(8, 12),
              )
            ],
            color: currentTheme.currentTheme == ThemeMode.dark
                ? Theme.of(context).cardColor
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Center(
              child: SingleChildScrollView(
                  child: CustomText(
                      text: widget.desc, fontSize: 18, color: Colors.white))),
        ),
      ),
    );
  }
}
