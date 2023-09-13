import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:top_news_flutter/config/routes/app_routes.dart';
import 'package:top_news_flutter/config/theme/app_theme.dart';
import 'package:top_news_flutter/providers.dart';

Future<void> main() async {

  await dotenv.load(fileName: ".env");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...Providers.list],
      child:  MaterialApp.router(
          title: 'Top News',
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
        ),
      );
  }
}