import 'package:flutter/widgets.dart';
import 'package:top_news_flutter/config/theme/app_theme.dart';

class TitleScreen extends StatelessWidget {
  final Color? textColor;
  final String text;

  const TitleScreen({super.key, this.textColor, required this.text});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Text(
              text,
              style: AppTheme.titleLarge.copyWith(color: textColor),
              textAlign: TextAlign.center,
            )));
  }
}