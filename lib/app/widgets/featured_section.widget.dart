import 'package:flutter/material.dart';
import 'package:flutter_academy/app/res/responsive.res.dart';
import 'package:flutter_academy/app/widgets/responsive_gap.widget.dart';

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

  final bool imageLeft;
  final String image;
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
          if (imageLeft || width <= ScreenSizes.md) ...[
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const ResponsiveGap(gap: 20.0),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: width <= ScreenSizes.md
                      ? TextAlign.center
                      : TextAlign.start,
                ),
                const SizedBox(height: 20.0),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18.0,
                      ),
                  textAlign: width <= ScreenSizes.md
                      ? TextAlign.center
                      : TextAlign.start,
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
          if (!imageLeft && width > ScreenSizes.md) ...[
            const ResponsiveGap(gap: 20.0),
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
