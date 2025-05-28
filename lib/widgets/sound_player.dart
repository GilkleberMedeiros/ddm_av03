import "package:flutter/material.dart";
import "package:just_audio/just_audio.dart";


class SoundsPlayer extends StatefulWidget 
{
  const SoundsPlayer({ super.key });

  @override
  State<StatefulWidget> createState() 
  {
    return _SoundsPlayerState();
  }
}

class _SoundsPlayerState extends State 
{
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  _SoundsPlayerState();

  Future<void> _playSound(String path) async
  {
    if (isPlaying) await _stopSound();

    await _player.setAsset(path);
    
    await _player.play();
    isPlaying = true;
  }

  Future<void> _stopSound() async 
  {
      await _player.stop();
      isPlaying = false;
  }

  @override
  Widget build(BuildContext context) 
  {
      double iconSize = 24.0;
      Color iconBtnsBkgColor = Theme.of(context).colorScheme.primary;
      Color iconBtnsFrgColor = Theme.of(context).colorScheme.onPrimary;

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(iconBtnsBkgColor),
                ), 
                color: iconBtnsFrgColor, 
                icon: Icon(
                  Icons.air,
                  size: iconSize,
                ),
                onPressed: () { _playSound("assets/audios/wind_rustling_grass.ogg"); },
              ), // Wind Rustling Grass Sound Button
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(iconBtnsBkgColor), 
                ), 
                color: iconBtnsFrgColor, 
                icon: Icon(
                  Icons.water,
                  size: iconSize,
                ), 
                onPressed: () { _playSound("assets/audios/river_sound.ogg"); },
              ), // River Flowing Sound Button
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(iconBtnsBkgColor),
                ), 
                color: iconBtnsFrgColor, 
                icon: Icon(
                  Icons.nightlight,
                  size: iconSize,
                ), 
                onPressed: () { _playSound("assets/audios/night_ambience.ogg"); }, 
              ), // Night Ambience Sound Button
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(iconBtnsBkgColor),
                ),
                color: iconBtnsFrgColor, 
                icon: Icon(
                  Icons.thunderstorm, 
                  size: iconSize, 
                ), 
                onPressed: () { _playSound("assets/audios/heavy_thunder.ogg"); }, 
              ), // Heavy Thunder Sound Button
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(iconBtnsBkgColor), 
                ), 
                color: iconBtnsFrgColor, 
                icon: Icon(
                  Icons.question_mark, 
                  size: iconSize,  
                ), 
                onPressed: () { _playSound("assets/audios/pop_rock.ogg"); }, 
              ), // Pop Rock Sound Button
            ],
          ), 
          SizedBox(height: 50), 
          IconButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(iconBtnsBkgColor)), 
            color: iconBtnsFrgColor, 
            icon: Icon(
              Icons.stop, 
              size: iconSize,
            ),
            onPressed: () { _stopSound(); }
          ), 
      ],
    );
  }
}