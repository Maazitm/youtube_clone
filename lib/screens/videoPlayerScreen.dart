import 'package:flutter/material.dart';
import 'package:youtube/widgets/ytActionButtonWidget.dart'; 
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoplayerscreen extends StatefulWidget {
  const Videoplayerscreen({super.key});

  @override
  State<Videoplayerscreen> createState() => _VideoplayerscreenState();
}

class _VideoplayerscreenState extends State<Videoplayerscreen> {
  late YoutubePlayerController _controller;
  String textValue = "Subscribe";
  bool isliked = false;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(
      "https://youtu.be/05DrDxjMEbU?si=-S-meYb5S6aZ8VTK",
    );

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false, loop: true),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
      builder: (context, player) {
        // 1. Get screen width
        final screenWidth = MediaQuery.of(context).size.width;

        return Scaffold(
          backgroundColor: Colors.white,
          // Optional: Add AppBar here if you want the top navigation bar like YouTube
          body: SafeArea(
            child: _buildResponsiveLayout(screenWidth, player),
          ),
        );
      },
    );
  }

  // ==========================================
  // RESPONSIVE LAYOUT ROUTER
  // ==========================================
  Widget _buildResponsiveLayout(double screenWidth, Widget player) {
    if (screenWidth >= 1000) {
      return _buildDesktopLayout(player);
    } else if (screenWidth >= 650) {
      return _buildTabletLayout(player);
    } else {
      return _buildMobileLayout(player);
    }
  }

  // ==========================================
  // 1. DESKTOP LAYOUT (> 1000px)
  // Split entire screen: Left (Video+Info), Right (Sidebar)
  // ==========================================
  Widget _buildDesktopLayout(Widget player) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7, // 70% width for video
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FIX: Force the video into a 16:9 ratio so it doesn't blow up full screen
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: player,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: _buildVideoInfo(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3, // 30% width for sidebar
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              child: _buildSuggestedVideos(),
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================
  // 2. TABLET LAYOUT (650px - 1000px)
  // ==========================================
  Widget _buildTabletLayout(Widget player) {
    return Column(
      children: [
        // FIX: Force 16:9 aspect ratio
        AspectRatio(
          aspectRatio: 16 / 9,
          child: player,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: _buildVideoInfo(),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
                    child: _buildSuggestedVideos(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ==========================================
  // 3. MOBILE LAYOUT (< 650px)
  // ==========================================
  Widget _buildMobileLayout(Widget player) {
    return Column(
      children: [
        // FIX: Force 16:9 aspect ratio
        AspectRatio(
          aspectRatio: 16 / 9,
          child: player,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildVideoInfo(),
                  const SizedBox(height: 20),
                  _buildSuggestedVideos(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================
  // HELPER WIDGETS
  // ==========================================
  Widget _buildVideoInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Doremon Theme Songs",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "1.5M views • 12 years ago",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                "https://yt3.ggpht.com/liohvwLzjjW8I6uSwIm26f9NV8ddUou9vVPBOCud84CKiqzZGWawxVftdUV4K4_HQb3ToSyEYw=s108-c-k-c0x00ffffff-no-rj",
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Anime Channel",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2.1M subscribers",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  textValue = (textValue == "Subscribe") ? "Subscribed" : "Subscribe";
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: textValue == "Subscribe"
                      ? Colors.black
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  textValue,
                  style: TextStyle(
                    color: textValue == "Subscribe"
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isliked = !isliked;
                  });
                },
                child: buildActionButton(
                  isliked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                  "1.5K",
                ),
              ),
              const SizedBox(width: 8),
              buildActionButton(Icons.thumb_down_alt_outlined, "Dislike"),
              const SizedBox(width: 8),
              buildActionButton(Icons.reply_outlined, "Share"),
              const SizedBox(width: 8),
              buildActionButton(Icons.download_outlined, "Download"),
              const SizedBox(width: 8),
              buildActionButton(Icons.library_add_outlined, "Save"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestedVideos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Suggested Videos",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        suggestedVideo(
          Colors.grey,
          "NASA discovers alien life on Mars",
          'https://images.seeklogo.com/logo-png/36/1/nasa-logo-png_seeklogo-369096.png',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFS7qZI7TDKUvcWqIfnWMghgJLWmukAm7WdvChyHRP-A&s=10',
        ),
        suggestedVideo(Colors.red, "Top 10 Doraemon Gadgets", '', ''),
        suggestedVideo(Colors.green, "Shinchan Funny Moments", '', ''),
        suggestedVideo(Colors.blue, "Amazing Space Documentary", '', ''),
        suggestedVideo(Colors.orange, "Flutter Complete Course", '', ''),
      ],
    );
  }
}