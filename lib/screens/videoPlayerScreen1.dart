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
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Video Player
                player,

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
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
                                    if (textValue == "Subscribe") {
                                      textValue = "Subscribed";
                                    } else {
                                      textValue = "Subscribe";
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: textValue == "Subscribe"
                                        ? Colors.grey.shade300
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    textValue,
                                    style: TextStyle(
                                      color: textValue == "Subscribe"
                                          ? Colors.black
                                          : Colors.grey.shade300,
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
                                      if (isliked == false) {
                                        isliked = true;
                                      } else {
                                        isliked = false;
                                      }
                                    });
                                  },
                                  child: buildActionButton(
                                    isliked
                                        ? Icons.thumb_up
                                        : Icons.thumb_up_alt_outlined,
                                    "1.5K",
                                  ),
                                ),
                                const SizedBox(width: 8),
                                
                                buildActionButton(
                                  Icons.thumb_down_alt_outlined,
                                  "Dislike",
                                ),
                                const SizedBox(width: 8),
                                buildActionButton(
                                  Icons.reply_outlined,
                                  "Share",
                                ),
                                const SizedBox(width: 8),
                                buildActionButton(
                                  Icons.download_outlined,
                                  "Download",
                                ),
                                const SizedBox(width: 8),
                                buildActionButton(
                                  Icons.library_add_outlined,
                                  "Save",
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

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
                            Icons.person,
                          ),

                          suggestedVideo(Colors.red, "Top 10 Doraemon Gadgets" , Icons.abc),

                          suggestedVideo(
                            Colors.green,
                            "Shinchan Funny Moments",
                            Icons.add
                          ),

                          suggestedVideo(
                            Colors.blue,
                            "Amazing Space Documentary",
                            Icons.alarm_rounded
                          ),

                          suggestedVideo(
                            Colors.orange,
                            "Flutter Complete Course",
                            Icons.account_balance_wallet_sharp
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
