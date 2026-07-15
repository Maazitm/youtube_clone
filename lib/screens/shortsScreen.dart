import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  late YoutubePlayerController _controller;
  String textValue = "Subscribe";
  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    // Make sure the URL you pass here is actually a vertical video (Shorts format)
    final videoId = YoutubePlayer.convertUrlToId(
      "https://youtu.be/ybAv3BL4zv4?si=1XYB4PczU59LOnHh", // Put your shorts URL here
    ) ?? "05DrDxjMEbU"; // Fallback ID

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
        hideControls: true, // CRITICAL: Hides default YT web controls
        disableDragSeek: true, // Prevents accidental scrubbing 
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Shorts background is always black
      body: SafeArea(
        child: Stack(
          children: [
            // 1. The Video Player Background
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                // We wrap it in a pointer interceptor so tapping the video 
                // doesn't trigger the hidden webview controls
                child: AbsorbPointer(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                ),
              ),
            ),

            // 2. Right Side Action Buttons
            Positioned(
              right: 12,
              bottom: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildActionIcon(
                    icon: isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                    label: "12K",
                    color: isLiked ? Colors.blue : Colors.white,
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  _buildActionIcon(icon: Icons.thumb_down_outlined, label: "Dislike"),
                  const SizedBox(height: 25),
                  _buildActionIcon(icon: Icons.comment, label: "405"),
                  const SizedBox(height: 25),
                  _buildActionIcon(icon: Icons.reply, label: "Share"),
                  const SizedBox(height: 25),
                  _buildActionIcon(icon: Icons.more_horiz, label: ""),
                ],
              ),
            ),

            // 3. Bottom Left Channel Info
            Positioned(
              left: 12,
              bottom: 40,
              right: 80, // Prevent overlapping with right icons
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          "https://ui-avatars.com/api/?name=Channel&background=random",
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "@Maazitm",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            textValue = textValue == "Subscribe" 
                                ? "Subscribed" 
                                : "Subscribe";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textValue == "Subscribe" 
                              ? Colors.white 
                              : Colors.grey.withOpacity(0.5),
                          foregroundColor: Colors.black,
                          minimumSize: const Size(80, 32),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        child: Text(textValue),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "This is an amazing Flutter Shorts clone layout! 🚀 #flutter #dart",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for the side icons to keep code clean
  Widget _buildActionIcon({
    required IconData icon, 
    required String label, 
    Color color = Colors.white, 
    VoidCallback? onTap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ]
        ],
      ),
    );
  }
}