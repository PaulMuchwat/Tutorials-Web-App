import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.image,
    required this.title,
    required this.onActionPressed,
    required this.description,
  }) : super(key: key);
  final String image;
  final String title;
  final Function() onActionPressed;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: Card(
        child: InkWell(
          onTap: onActionPressed,
          child: Column(
            children: [
              Image.asset(
                image,
                height: 250,
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10.0),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
