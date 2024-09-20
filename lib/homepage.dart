import 'package:flutter/material.dart';
import 'placepage.dart'; // Import PlacesPage
import 'contactpage.dart'; // Import ContactPage

class HomePage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  HomePage({required this.onThemeChanged});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Tracks the selected index of BottomNavigationBar

  final List<Widget> _pages = [
    HomePage(onThemeChanged: (bool) {}), // Home Page
    PlacesPage(onThemeChanged: (bool) {}), // Places Page
    ContactPage(onThemeChanged: (bool) {}), // Contact Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo3.png',
          width: 100,
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 95, 75),
      ),

      // Sub-navbar with subtitle
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Discover Places',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ],
              ),
            ),

            // Places to Visit Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Top Places to Visit',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF04B177),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Column of place cards
                  Column(
                    children: [
                      placeCard('assets/images/1.jpg', 'Beautiful Moles',
                          'A pristine house with crystal clear view.'),
                      SizedBox(height: 15),
                      placeCard('assets/images/2.jpg', 'Mountain Peak',
                          'Stunning mountain views and hiking trails.'),
                      SizedBox(height: 15),
                      placeCard('assets/images/3.jpg',
                          'Agri-culture move', 'Harvesting in Rwanda in ancient modern.'),
                      SizedBox(height: 15),
                      placeCard('assets/images/4.jpg',
                          'Historical Monument', 'Past history and breathtaking architecture.'),
                      SizedBox(height: 15),
                      placeCard('assets/images/park5.jpg', 'Nyandungu park',
                          'Nyandungu Wetland complex in the outskirts of Kigali.'),
                       SizedBox(height: 15),
                      placeCard('assets/images/gisenyi.jpg', 'Gisenyi&lake-kivu',
                          'Gisenyi&lake-kivu is one of the most places that is visited by foreigners and even rwandans for great holidays'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navbar with images for Home, Places, and Contact (without labels)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Update this based on the current page
        backgroundColor: const Color.fromARGB(255, 18, 103, 70),
        showSelectedLabels: false, // Hides selected item label
        showUnselectedLabels: false, // Hides unselected item labels
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(onThemeChanged: widget.onThemeChanged),
              ),
            ); // Navigate to HomePage
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PlacesPage(onThemeChanged: widget.onThemeChanged),
              ),
            ); // Navigate to PlacesPage
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ContactPage(onThemeChanged: widget.onThemeChanged),
              ),
            ); // Navigate to ContactPage
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', width: 24, height: 24), // Home icon
            label: "", // No label
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/place.png', width: 24, height: 24), // Places icon
            label: "", // No label
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/more.png', width: 24, height: 24), // Contact icon
            label: "", // No label
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
      ),
    );
  }

  // Widget for place card, fits the screen width and height dynamically
  Widget placeCard(String image, String title, String description) {
    return Container(
      width: double.infinity, // Ensures the card takes up the full screen width
      height: 250, // Sets a consistent height for the cards
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12, spreadRadius: 1)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 160, // Image height
              width: double.infinity, // Makes sure the image stretches across the screen
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
