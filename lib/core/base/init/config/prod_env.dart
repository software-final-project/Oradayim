import 'package:envied/envied.dart';
import 'package:oradayim/core/base/init/config/app_configuration.dart';

part 'prod_env.g.dart';

@Envied(path: 'assets/env/.dev.env', obfuscate: true)

/// Production environment variables
final class ProdEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _ProdEnv._baseUrl;

  @EnviedField(varName: 'MAP_API_KEY')
  static final String _mapApiKey = _ProdEnv._mapApiKey;

  @override
  String get mapApiKey => _mapApiKey;

  @override
  String get baseUrl => _baseUrl;
}
