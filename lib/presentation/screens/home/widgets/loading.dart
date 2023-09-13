import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Align(
        alignment: Alignment.center,
        child:
            SizedBox(
              height: 40, 
              width: 40, 
              child: CircularProgressIndicator(
                color: colors.tertiary,
                strokeWidth: 6,
                strokeCap: StrokeCap.round,
            )),
      );
  }
}