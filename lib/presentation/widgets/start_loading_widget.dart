import 'package:flutter/material.dart';
import 'package:deriv/core/values/colors.dart' as colors;

class StartLoadingWidget extends StatelessWidget {
  const StartLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 3.0,
            child: const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(colors.accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
