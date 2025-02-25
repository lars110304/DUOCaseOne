import 'package:flutter/material.dart';

class DescriptionInfoWidget extends StatelessWidget {
  const DescriptionInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.emoji_emotions, color: Color(0xff2F9675)),
            SizedBox(width: 5),
            Text(
              '3 reactions',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2F9675)),
            ),
            SizedBox(width: 15),
            Icon(Icons.location_on, color: Color(0xff2F9675)),
            SizedBox(width: 5),
            Text(
              'Eindhoven, Strijp S',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2F9675)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Too much plastic',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "I've been walking with my dog here, and I can't help but notice how much plastic is scattered around. It's disheartening to see so much litter in such a beautiful area. From plastic bottles to bags, it seems like every corner has some form of waste. This has become a real problem, and it’s frustrating to see how little people care about the environment ...",
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }
}
