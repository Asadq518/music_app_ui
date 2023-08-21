import 'package:flutter/material.dart';
import 'package:music_app/components/style.dart';

import '../components/colors.dart';
import '../components/custom_slider_mark_shape.dart';
import '../components/music_controll_btn.dart';
import '../components/my_button.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  var _value = 0.3;
  var _isPlay = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: backgroundGradient,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyToolbar(),
              20.ph,
              const CircleMusicImage(),
              30.ph,
              Text('Low Life', style: textTheme.headlineLarge),
              Text('Future ft. The Weeknd', style: textTheme.headlineSmall),
              20.ph,
              const MusicTimers(
                currentTime: '1:17',
                totalDuration: '2:47',
              ),
              //======Music Slider=========
              Stack(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.amber[700],
                      inactiveTrackColor: MyColors.black,
                      trackShape: const RoundedRectSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbColor: Colors.redAccent,
                      thumbShape: CustomSliderMarkShape(tickMarkRadius: 18.0),
                      overlayColor: Colors.amber.withAlpha(32),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 10.0),
                    ),
                    child: Slider(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: OutlineSlider(),
                  ),
                ],
              ),
              const Spacer(),
             //======Music Controlls=========
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  20.pw,
                  const MusicControlButton(
                    icons: Icons.fast_rewind_rounded,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlay = !_isPlay;
                      });
                    },
                    child: MusicControlButton(
                      icons: _isPlay
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      isPlay: _isPlay,
                    ),
                  ),
                  const MusicControlButton(
                    icons: Icons.fast_forward_rounded,
                  ),
                  20.pw,
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlineSlider extends StatelessWidget {
  const OutlineSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      width: double.infinity,
      height: 5,
      decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}

class MusicTimers extends StatelessWidget {
  const MusicTimers({
    super.key,
    required this.totalDuration,
    required this.currentTime,
  });

  final String totalDuration;
  final String currentTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.pw,
        Text(
          currentTime,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Spacer(),
        Text(
          totalDuration,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        10.pw
      ],
    );
  }
}

class CircleMusicImage extends StatelessWidget {
  const CircleMusicImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding / 2),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: MyColors.btnGradentDark,
        shape: BoxShape.circle,
        boxShadow: myWhiteAndBlackOuterShaddow,
      ),
      child: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://www.goutemesdisques.com/uploads/tx_gmdchron/pi1/_processed_/csm_Future-Evol-Artwork1_976c9557fc.jpg',
        ),
      ),
    );
  }
}

class MyToolbar extends StatelessWidget {
  const MyToolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MyButton(
          icon: Icons.arrow_back_rounded,
        ),
        Expanded(
            child: Text(
          'PLAYING NOW',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        )),
        const MyButton(
          icon: Icons.table_rows_rounded,
        ),
      ],
    );
  }
}
