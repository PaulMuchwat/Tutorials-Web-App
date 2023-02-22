import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy/res/assets.dart';
import 'package:flutter_academy/res/responsive.dart';
import 'package:flutter_academy/widgets/call_to_action.dart';
import 'package:flutter_academy/widgets/course_card.dart';
import 'package:flutter_academy/widgets/featured_section.dart';
import 'package:flutter_academy/widgets/footer.dart';
import 'package:flutter_academy/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          AppBar(
            title: const Text('Flutter Academy'),
            elevation: kIsWeb ? 0 : null,
            centerTitle: kIsWeb ? false : null,
            actions: (MediaQuery.of(context).size.width <= ScreenSizes.md)
                ? null
                : [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text("Home"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text("Courses"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text("About"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text("Contact"),
                    ),
                  ],
          ),
          const Header(),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Recent Videos",
                style: Theme.of(context).textTheme.displaySmall),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 450,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 20.0),
                CourseCard(
                  title: "Taking Flutter to Web",
                  image: Assets.course,
                  description:
                      "Flutter web is stable. But there are no proper courses focused on Flutter web. So, in this course we will learn what Flutter web is good for and we will build a production grade application along the way.",
                  onActionPressed: () {},
                ),
                const SizedBox(width: 20.0),
                CourseCard(
                  title: "Flutter for Everyone",
                  image: Assets.course,
                  description:
                      "Flutter beginners' course for everyone. For those who know basic programming, can easily start developing Flutter apps after taking this course.",
                  onActionPressed: () {},
                ),
                // ... you can add more courses
              ],
            ),
          ),
          Center(
            child: FeaturedSection(
              image: Assets.instructor,
              title: "Start teaching today",
              description:
                  "Instructors from around the world teach millions of students on Udemy. We provide the tools and skills to teach what you love.",
              buttonLabel: "Become an instructor",
              onActionPressed: () {},
            ),
          ),
          Center(
            child: FeaturedSection(
              imageLeft: false,
              image: Assets.instructor,
              title: "Transform your life through education",
              description:
                  "Education changes your life beyond your imagination. Education enables you to achieve your dreams.",
              buttonLabel: "Start learning",
              onActionPressed: () {},
            ),
          ),
          const CallToAction(),
          Center(
            child: FeaturedSection(
              imageLeft: false,
              image: Assets.instructor,
              title: "Know your instructors",
              description:
                  "Know your instructors. We have chosen the best of them to give you highest quality courses.",
              buttonLabel: "Browse",
              onActionPressed: () {},
            ),
          ),
          const Footer(),
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : Drawer(
              child: ListView(
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Flutter Academy",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    title: const Text("Home"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Courses"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("About"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Contact"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
    );
  }
}
