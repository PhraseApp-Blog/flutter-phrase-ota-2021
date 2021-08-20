import 'package:flutter/material.dart';
import 'package:phrase/phrase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/phrase_localizations.dart';
import 'package:flutter_phrase_ota_2021/services/config/config.dart';
import 'package:flutter_phrase_ota_2021/features/hereos/hero_list.dart';

Future<void> main() async {
  await Config.load();

  Phrase.setup(
    Config.phraseOtaDistributionId!,
    Config.phraseOtaProductionSecret!,
    customAppVersion: '0.99.100',
    checkForUpdates: false,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: PhraseLocalizations.localizationsDelegates,
      supportedLocales: PhraseLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            HeroList(title: AppLocalizations.of(context)!.appTitle)
      },
    );
  }
}
