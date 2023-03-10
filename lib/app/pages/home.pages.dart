import 'package:flutter/material.dart';
import 'package:flutter_academy/app/res/assets.res.dart';
import 'package:flutter_academy/app/res/responsive.res.dart';
import 'package:flutter_academy/app/widgets/call_to_action.widget.dart';
import 'package:flutter_academy/app/widgets/course_card.widget.dart';
import 'package:flutter_academy/app/widgets/featured_section.widget.dart';
import 'package:flutter_academy/app/widgets/footer.widget.dart';
import 'package:flutter_academy/app/widgets/header.widget.dart';
import 'package:flutter_academy/app/widgets/top_nav.widget.dart';
import 'package:flutter_academy/app/widgets/drawer_nav.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const TopNav(),
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
          : const DrawerNav(),
    );
  }
}
