import 'package:flutter/material.dart';
import 'homepage.dart'; // Import HomePage for navigation
import 'placepage.dart'; // Import PlacesPage for navigation

class ContactPage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  ContactPage({required this.onThemeChanged});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int _currentIndex = 2; // Set default to the contact page
  bool isDarkTheme = false; // Default to light theme
  bool isNotificationsEnabled = true; // Default notifications on

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkTheme ? Colors.white : Colors.black;
    final backgroundColor = isDarkTheme ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 95, 75),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo3.png', // Path to your logo image
          width: 100,
          height: 50, // Adjust the height as needed
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'More...',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF007BFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SettingsSection(
                isDarkTheme: isDarkTheme,
                onThemeChanged: (value) {
                  setState(() {
                    isDarkTheme = value;
                    widget.onThemeChanged(isDarkTheme); // Toggle the theme globally
                  });
                },
                isNotificationsEnabled: isNotificationsEnabled,
                onNotificationChanged: (value) {
                  setState(() {
                    isNotificationsEnabled = value;
                  });
                },
                textColor: textColor,
              ),
              SizedBox(height: 20),
              Text(
                "Let's Talk",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF04B177),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ContactForm(textColor: textColor),
              SizedBox(height: 40),
              ContactInfo(textColor: textColor),
              SizedBox(height: 40),
              SocialMediaImages(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 18, 103, 70),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/homepage');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/places');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/contact');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', width: 24, height: 24),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/place.png', width: 24, height: 24),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/more.png', width: 24, height: 24),
            label: "",
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
      ),
    );
  }
}

// Settings Section Widget
class SettingsSection extends StatelessWidget {
  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;
  final bool isNotificationsEnabled;
  final ValueChanged<bool> onNotificationChanged;
  final Color textColor;

  SettingsSection({
    required this.isDarkTheme,
    required this.onThemeChanged,
    required this.isNotificationsEnabled,
    required this.onNotificationChanged,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
            color: Color(0xFF007BFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dark Theme',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            Switch(
              value: isDarkTheme,
              onChanged: onThemeChanged,
              activeColor: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Enable Notifications',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            Switch(
              value: isNotificationsEnabled,
              onChanged: onNotificationChanged,
              activeColor: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
          'About',
          style: TextStyle(fontSize: 18,color: Color(0xFF007BFF),),
        ),
        SizedBox(height: 10),
        Text(
          'TravelRW is a mobile app that is for visiting rwanda and knowing much about its culture and also promoting "VISIT RWANDA " brand ',
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ],
    );
  }
}

// Contact Form Widget
class ContactForm extends StatelessWidget {
  final Color textColor;

  ContactForm({required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyle(fontSize: 16, color: textColor),
          ),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Your Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          Text(
            'Email',
            style: TextStyle(fontSize: 16, color: textColor),
          ),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Your Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          Text(
            'Message',
            style: TextStyle(fontSize: 16, color: textColor),
          ),
          SizedBox(height: 5),
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Your Message',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
            },
            child: Text('Send Message',
             style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1E90FF),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}

// Contact Info Widget
class ContactInfo extends StatelessWidget {
  final Color textColor;

  ContactInfo({required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Get in Touch',
          style: TextStyle(
            fontSize: 22,
            color: Color(0xFF007BFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/phone.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 10),
            Text('+250-780-123456', style: TextStyle(fontSize: 18, color: textColor)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/email.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 10),
            Text('info@travelrw.com', style: TextStyle(fontSize: 18, color: textColor)),
          ],
        ),
      ],
    );
  }
}

// Social Media Images Widget
class SocialMediaImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/facebook.png', width: 30, height: 30),
        SizedBox(width: 20),
        Image.asset('assets/images/twitter.png', width: 30, height: 30),
        SizedBox(width: 20),
        Image.asset('assets/images/instagram.png', width: 30, height: 30),
      ],
    );
  }
}
