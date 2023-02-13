import 'package:flutter/material.dart';
import 'package:flutter_academy/res/responsive.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onActionPressed,
    this.imageLeft = true,
  }) : super(key: key);

  final String image;
  final bool imageLeft;
  final String title;
  final String description;
  final String buttonLabel;
  final Function() onActionPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: width > ScreenSizes.md ? null : 600,
      padding: const EdgeInsets.all(32.0),
      child: Flex(
        direction: getAxis(width),
        children: [
          if (imageLeft)
            Expanded(
              child: Image.asset(
                image,
                height: 450,
              ),
            ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 20.0),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18.0,
                      ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: onActionPressed,
                    child: Text(buttonLabel),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 20.0),
          if (!imageLeft)
            Expanded(
              child: Image.asset(
                image,
                height: 450,
              ),
            ),
        ],
      ),
    );
  }
}
