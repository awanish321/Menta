import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateReel extends StatefulWidget {
  const CreateReel({super.key});

  @override
  State<CreateReel> createState() => _CreateReelState();
}

class _CreateReelState extends State<CreateReel> {
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode = brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                Colors.pinkAccent.withOpacity(0.2),
                Colors.pinkAccent.withOpacity(0.2),
                isDarkMode ? Colors.black : Colors.white,
              ],
              stops: const [0.0, 0.1, 0.7,],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: (){},
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0.3, color: Colors.pink),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.pink,),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      "Create a Reel",
                      style: TextStyle(fontSize: 22, color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 90,),
                Stack(
                  children: [
                    SvgPicture.asset("assets/Lamp.svg"),
                    Positioned(
                      bottom: 48,
                      right: 30,
                      left: 30,
                      child: SvgPicture.asset(
                        "assets/Layer_1.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  height: 180,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.4, color: Colors.pink),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.pink.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap:(){},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFAD1457),
                                      Colors.redAccent
                                    ])),
                                child: SvgPicture.asset(
                                  "assets/ph_camera-bold.svg",
                                  clipBehavior: Clip.hardEdge,
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Expanded(
                              child: Text(
                                "CAMERA",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 35),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFAD1457),
                                      Colors.redAccent
                                    ])),
                                child: SvgPicture.asset(
                                  "assets/ph_video-bold.svg",
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Expanded(
                              child: Text(
                                "VIDEO",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 35),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFAD1457),
                                      Colors.redAccent
                                    ])),
                                child: SvgPicture.asset(
                                  "assets/icon-park-outline_picture.svg",
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Expanded(
                              child: Text(
                                "PICTURES",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                const Text(
                  "The editor utilizes your phone's hardware for editing & creating reels, which may result in lag if you are using a device with lower configuration.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


