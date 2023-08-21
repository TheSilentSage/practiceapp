import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WaitingScreen(),
    );
  }
}

class WaitingScreen extends StatelessWidget {
  final int _duration = 600; // 10 minutes in seconds

  final List<String> _treasureTips = [
    "Read Clues Carefully: Pay close attention to every word in the clues provided. Even a small detail could lead you to the treasure.",
    "Teamwork: If it's a team treasure hunt, communicate and collaborate effectively with your teammates. Two heads are often better than one.",
    "Map Orientation: Study the map provided to get an understanding of the general area where the treasure might be hidden.",
    "Think Outside the Box: Don't limit yourself to literal interpretations. Clues might be metaphorical or require creative thinking.",
    "Research: If the treasure hunt involves historical or cultural elements, do some research about the location and its significance.",
    "Explore Thoroughly: Don't rush through the search area. Take your time to explore every nook and cranny.",
    "Use Technology: If allowed, use smartphones or GPS devices to pinpoint specific locations and distances.",
    "Follow Patterns: Sometimes, treasure hunts have patterns that can help you predict the next clue's location.",
    "Ask for Help: If you're stuck, don't hesitate to ask for hints from the organizers or fellow participants.",
    "Keep Track: Document your progress and the locations you've checked. This can prevent backtracking and wasting time.",
    "Look Low and High: Treasures can be hidden at different levels, so remember to search both above and below eye level.",
    "Pay Attention to the Environment: Natural landmarks, architectural features, and local flora could be important clues.",
    "Stay Safe: Prioritize safety while searching. Avoid dangerous areas and always have a buddy if possible.",
    "Bring Tools: Depending on the hunt, carrying a small flashlight, magnifying glass, or even a small shovel might be helpful.",
    "Physical Puzzles: Be prepared for puzzles that require physical manipulation, like unlocking locks or solving riddles.",
    "Stay Organized: Keep clues, maps, and any notes in an organized manner to refer back to when needed.",
    "Don't Disregard Small Details: A seemingly insignificant detail in one clue might become crucial in another.",
    "Observe Others: If you're participating in a public space, observe how others are interpreting clues – it might give you insights.",
    "Stay Positive: Treasure hunts can be challenging, but a positive attitude will keep you motivated to continue searching.",
    "Have Fun: Remember that treasure hunts are meant to be enjoyable. Embrace the adventure and have fun with the process!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Countdown(
              seconds: _duration,
              build: (BuildContext context, double time) {
                int minutes = time ~/ 60;
                int seconds = time.toInt() % 60;
                return Text(
                  '$minutes:${seconds.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                );
              },
              interval: const Duration(milliseconds: 100),
              onFinished: () {
                print('Timer is done!');
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Treasure Hunt Tips",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Container(
              width: 350,
              height: 400,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: _treasureTips.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 2),
                    leading: const Icon(Icons.star, color: Colors.blue),
                    title: Text(
                      _treasureTips[index],
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
