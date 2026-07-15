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
          ), // Text is now black
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Allows horizontal scrolling
                child: Row(
                  children: [
                    // 1. Compass Icon
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.explore,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // 2. "All" Button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F0F0F), // Near black
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "All",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // 3. "New to you" Button with Gradient Border
                    Container(
                      padding: const EdgeInsets.all(
                        1.5,
                      ), // This acts as the border width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF534C7C), // Purple/Blue
                            Color(0xFFA54B76), // Pink
                            Color(0xFFC7556A), // Red
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6.5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFF2F2F2,
                          ), // Inner background color
                          borderRadius: BorderRadius.circular(
                            6.5,
                          ), // Slightly smaller than outer radius
                        ),
                        child: const Text(
                          "New to you",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    // 4. "UX design" Button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2), // Light grey
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "UX design",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // 5. "Figma" Button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2), // Light grey
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Figma",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/videoPlayerScreen');
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                        image: AssetImage("assets/images/mars.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 230,
                  right: 0,
                  left: 350,
                  bottom: 0,
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
                      image: const DecorationImage(
                        image: AssetImage('assets/images/nasa_logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
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
                  Spacer(),
                  Icon(Icons.more_vert, color: Colors.black, size: 20),
                ],
              ),
            ),
            SizedBox(height: 14),
            Divider(
              color: const Color.fromARGB(255, 215, 215, 215),
              thickness: 8,
              height: 1,
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/shorts.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
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
              height: 250,
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
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/short/shorts${index + 1}.png",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      image: AssetImage("assets/images/volcano.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 230,
                  right: 0,
                  left: 350,
                  bottom: 0,
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
                      image: const DecorationImage(
                        image: AssetImage('assets/images/volcano_logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
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
                  Spacer(),
                  Icon(Icons.more_vert, color: Colors.black, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
