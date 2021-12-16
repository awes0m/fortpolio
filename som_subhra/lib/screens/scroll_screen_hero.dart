import 'package:flutter/material.dart';
import 'package:som_subhra/utils/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class ScrollScreenHero extends StatelessWidget {
  const ScrollScreenHero({
    Key? key,
    required double scrollPosition,
    required this.height,
    required this.width,
  })  : _scrollPosition = scrollPosition,
        super(key: key);

  final double _scrollPosition;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final nameStyle = Theme.of(context).textTheme.headline2;
    final descriptionStyle = Theme.of(context).textTheme.headline6;
    return Stack(
      children: [
        Positioned(
          top: -.25 * _scrollPosition,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: kHeroImage,
            height: height,
            width: width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: -.25 * _scrollPosition,
          child: SizedBox(
              height: height,
              width: width,
              child: Align(
                alignment: const Alignment(0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: height * .1,
                          child: Image.asset(
                            profileImage,
                            height: height * .1,
                            width: height * .1,
                          ),
                        ),
                        SizedBox(width: width * .05),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Som Subhra',
                              style: nameStyle!.copyWith(
                                backgroundColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Dreamer, Believer, Engineer',
                              style: descriptionStyle!.copyWith(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "About Me",
                      style: descriptionStyle.copyWith(
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
