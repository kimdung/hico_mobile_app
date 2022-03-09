import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../constants/colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    Key? key,
    this.needWave = true,
    this.needTopSafeArea = true,
    this.needTopRadius = false,
    this.child,
  }) : super(key: key);
  final bool needWave;
  final Widget? child;
  final bool needTopSafeArea;
  final bool needTopRadius;

  @override
  Widget build(BuildContext context) {
    return needTopSafeArea
        ? Container(
            color: Theme.of(context).colorScheme.primaryVariant,
            child: SafeArea(
              child: _buildBackground(context),
            ),
          )
        : _buildBackground(context);
  }

  Widget _buildBackground(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: needTopRadius
                ? const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )
                : null,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.9],
              colors: [
                AppColor.primaryColorLight,
                AppColor.defaultHeaderOSColorLight
              ],
            ),
          ),
          child: child,
        ),
        if (needWave)
          Positioned(
            bottom: 0,
            left: 0,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [hexToColor('#087f23'), hexToColor('#339966')],
                  [hexToColor('#087f23'), hexToColor('#339966')],
                  [hexToColor('#4CAF50'), hexToColor('#66CC66')],
                  [hexToColor('#4CAF50'), hexToColor('#66CC66')]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: const MaskFilter.blur(BlurStyle.solid, 1),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 20,
              size: Size(
                MediaQuery.of(context).size.width,
                60,
              ),
            ),
          ),
      ],
    );
  }
}
