import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './env.dart';

class Config {
  static const String fileName = '.env';

  static Future load() async => await dotenv.load(fileName: fileName);

  static String? get(String key) => dotenv.env[key];

  static Env get env {
    if (kDebugMode) {
      return Env.Debug;
    } else if (kReleaseMode) {
      return Env.Release;
    } else {
      return Env.Unknown;
    }
  }

  static String? get phraseOtaDistributionId =>
      get('PHRASE_OTA_DISTRIBUTION_ID');

  static String? get phraseOtaSecret {
    if (env == Env.Debug) {
      return get('PHRASE_OTA_DEV_SECRET');
    } else if (env == Env.Release) {
      return get('PHRASE_OTA_PRODUCTION_SECRET');
    }
  }

  static String? get phraseOtaDevelopmentSecret => get('PHRASE_OTA_DEV_SECRET');

  static String? get phraseOtaProductionSecret =>
      get('PHRASE_OTA_PRODUCTION_SECRET');
}
