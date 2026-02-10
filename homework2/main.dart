import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const IPhoneFrame(),
    );
  }
}

class IPhoneFrame extends StatelessWidget {
  const IPhoneFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 380,
          height: 800,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 20,
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: const IPhoneScreen(),
        ),
      ),
    );
  }
}

class IPhoneScreen extends StatelessWidget {
  const IPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(height: 10),
          DynamicIsland(),
          IOSStatusBar(),
          ImageSection(image: 'images/lake.jpg'),
          TitleSection(
            name: 'Oeschinen Lake Campground',
            location: 'Kandersteg, Switzerland',
          ),
          ButtonSection(),
          TextSection(
            description:
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                'Bernese Alps. Situated 1,578 meters above sea level, it '
                'is one of the larger Alpine Lakes. A gondola ride from '
                'Kandersteg, followed by a half-hour walk through pastures '
                'and pine forest, leads you to the lake, which warms to 20 '
                'degrees Celsius in the summer. Activities enjoyed here '
                'include rowing, and riding the summer toboggan run.',
          ),
        ],
      ),
    );
  }
}

class DynamicIsland extends StatelessWidget {
  const DynamicIsland({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 140,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class IOSStatusBar extends StatelessWidget {
  const IOSStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "4:04",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            Row(
              children: const [
                // الأبراج = ثلاث نقاط
                Icon(CupertinoIcons.ellipsis, size: 20),

                SizedBox(width: 6),
                Icon(CupertinoIcons.wifi, size: 20),

                SizedBox(width: 6),
                Icon(CupertinoIcons.battery_full, size: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            CupertinoIcons.star_fill,
            color: Colors.red,
            size: 22,
          ),
          const SizedBox(width: 4),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ButtonWithText(
            color: Colors.blue,
            icon: CupertinoIcons.phone,
            label: 'CALL',
          ),
          ButtonWithText(
            color: Colors.blue,
            icon: CupertinoIcons.location,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: Colors.blue,
            icon: CupertinoIcons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
