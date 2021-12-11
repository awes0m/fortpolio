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
              )),
        ),
      ],
    );
  }
}
