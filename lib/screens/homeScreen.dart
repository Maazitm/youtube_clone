
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // 1. Get screen width to determine responsiveness
    final double screenWidth = MediaQuery.of(context).size.width;

    // 2. Decide how many columns based on device type
    int crossAxisCount = 1; // Default for mobile
    if (screenWidth > 1200) {
      crossAxisCount = 4; // Large Desktop
    } else if (screenWidth > 800) {
      crossAxisCount = 3; // Laptop
    } else if (screenWidth > 600) {
      crossAxisCount = 2; // Tablet
    }

    // 3. Calculate width for each video card (subtracting padding)
    double cardWidth = crossAxisCount == 1 ? screenWidth : (screenWidth / crossAxisCount) - 16;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 43,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(right: 0, left: 8, top: 8, bottom: 8),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 0,
        title: Text(
          "YouTube",
          style: GoogleFonts.oswald(
            color: Colors.black,
            fontSize: 25,
          ), 
        ),
        actions: [
          const Icon(Icons.cast, color: Colors.black, size: 25),
          const SizedBox(width: 12),
          const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
            size: 25,
          ),
          const SizedBox(width: 12),
          const Icon(Icons.search, color: Colors.black, size: 25),
          const SizedBox(width: 12),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage(
                  "https://yt3.ggpht.com/liohvwLzjjW8I6uSwIm26f9NV8ddUou9vVPBOCud84CKiqzZGWawxVftdUV4K4_HQb3ToSyEYw=s108-c-k-c0x00ffffff-no-rj",
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP CATEGORIES (Scrolls horizontally)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, 
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Icon(Icons.explore, color: Colors.black, size: 25),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F0F0F), 
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "All",
                        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(1.5), 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF534C7C), Color(0xFFA54B76), Color(0xFFC7556A)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2), 
                          borderRadius: BorderRadius.circular(6.5), 
                        ),
                        child: const Text(
                          "New to you",
                          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "UX design",
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2), 
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Figma",
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // MAIN VIDEO FEED (Responsive Wrap)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                spacing: 12, // Space between cards on same row
                runSpacing: 16, // Space between rows
                children: [
                  // VIDEO 1: Mars
                  SizedBox(
                    width: cardWidth,
                    child: _buildVideoCard(
                      context: context,
                      thumbnailPath: "assets/images/mars.png",
                      logoPath: "assets/images/nasa_logo.png",
                      onTapRoute: '/videoPlayerScreen',
                    ),
                  ),

                  // VIDEO 2: Volcano
                  SizedBox(
                    width: cardWidth,
                    child: _buildVideoCard(
                      context: context,
                      thumbnailPath: "assets/images/volcano.png",
                      logoPath: "assets/images/volcano_logo.png",
                      onTapRoute: '/videoPlayerScreen', // Add your route if needed
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),
            const Divider(
              color: Color.fromARGB(255, 215, 215, 215),
              thickness: 8,
              height: 1,
            ),
            const SizedBox(height: 14),

            // SHORTS SECTION
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/shorts.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Shorts",
                    style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250, // Keep your original height
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/shortsScreen');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 250,
                        width: 150,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            // EXACT PATH KEPT HERE
                            image: AssetImage("assets/short/shorts${index + 1}.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // EXTRACTED REUSABLE WIDGET FOR EXACT UI
  // ==========================================
  Widget _buildVideoCard({
    required BuildContext context,
    required String thumbnailPath,
    required String logoPath,
    required String onTapRoute,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, onTapRoute);
              },
              child: AspectRatio(
                // Aspect ratio makes sure it scales nicely on desktop without hardcoding height to 250
                aspectRatio: 16 / 9, 
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      image: AssetImage(thumbnailPath), // Exact Path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                height: 25,
                width: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(180, 0, 0, 0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    "16:35",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(logoPath), // Exact Path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded( // Prevents overflow on smaller screens
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Breaking! NASA discovers alien life \non Mars ",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "NASA • 99.2 M views  • Now",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.black, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
