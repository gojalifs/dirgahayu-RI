import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCountCompleted = false;
  bool isTextCompleted = false;

  String splitText = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: isCountCompleted
            ? const DirgahayuText()
            : CircularCountDownTimer(
                width: 150,
                height: 150,
                duration: 5,
                fillColor: Colors.red,
                ringColor: Colors.white,
                textStyle: const TextStyle(color: Colors.white),
                autoStart: true,
                isReverse: true,
                onComplete: () {
                  setState(() {
                    isCountCompleted = true;
                  });
                },
              ),
      ),
    );
  }
}

class DirgahayuText extends StatefulWidget {
  const DirgahayuText({Key? key}) : super(key: key);

  final bool isTextCompleted = false;

  @override
  State<DirgahayuText> createState() => _DirgahayuTextState();
}

class _DirgahayuTextState extends State<DirgahayuText> {
  bool isTextCompleted = false;
  String text = 'DIRGAHAYUINDONESIAKU ';
  String splitText = '';
  Future startAnimate() async {
    for (var item in text.split('')) {
      await Future.delayed(
        const Duration(milliseconds: 250),
        () {
          setState(() {
            splitText = item;
          });
        },
      );
    }
  }

  @override
  void initState() {
    startAnimate().then((value) {
      setState(() {
        isTextCompleted = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isTextCompleted
        ? Stack(
            children: [
              Container(
                  alignment: const FractionalOffset(0.5, 0.5),
                  child: Image.asset('assets/images/bendera.gif')),
              Container(
                alignment: const FractionalOffset(0.8, 0.2),
                child: Image.asset(
                  'assets/images/hut_logo.png',
                  width: 200,
                ),
              ),
              Container(
                alignment: const FractionalOffset(0.5, 0.8),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    totalRepeatCount: 2,
                    stopPauseOnTap: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Jayalah Selalu,',
                        textStyle: GoogleFonts.poppins(),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Harumlah Namamu,',
                        textStyle: GoogleFonts.poppins(),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Indonesiaku.',
                        textStyle: GoogleFonts.poppins(),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Merdeka!',
                        textStyle: GoogleFonts.poppins(),
                        speed: const Duration(milliseconds: 150),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        : Center(child: Text(splitText));
  }
}
