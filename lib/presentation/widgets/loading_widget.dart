import 'package:flutter/material.dart';
import 'package:deriv/core/values/colors.dart' as colors;

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(colors.accentColor),
      ),
    );
  }
}
