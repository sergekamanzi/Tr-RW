import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the height of the screen
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image taking the top half of the screen with border radius on bottom left
          Positioned(
            child: Container(
              height: screenHeight * 0.6, // Takes 60% of the screen height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome1.jpg'), // Background image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90), // Adds border radius to bottom left
                ),
              ),
            ),
          ),
          // "Need VACATION?" text at the top-left with padding
          Positioned(
            top: 180, // Adjust the distance from the top
            left: 20, // Adjust the distance from the left
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Need",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "VACATION?",
                  style: TextStyle(
                    fontSize: 36,
                    color: const Color.fromARGB(255, 18, 51, 107),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's take a trip with us.",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 35, 34, 34),
                  ),
                ),
              ],
            ),
          ),
          // "WELCOME to TRAVEL RW." text in the center (without logo)
          Positioned(
            top: screenHeight * 0.66, // Adjust this to move it down
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Removed the logo image from here
                Text(
                  "WELCOME to",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
                Text(
                  "TRAVEL RW.",
                  style: TextStyle(
                    fontSize: 34,
                    color: const Color.fromARGB(255, 30, 163, 37),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "explore more now.",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 39, 38, 38),
                  ),
                ),
              ],
            ),
          ),
          // "Get Started" button centered, but moved upwards a bit
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50), // Move the button up from the bottom
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to HomePage when button is pressed
                  Navigator.pushNamed(context, '/homepage');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 19, 87, 74),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Remove border radius
                  ),
                ),
                child: Text(
                  "Get Started now",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
