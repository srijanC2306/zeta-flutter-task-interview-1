const flavor = String.fromEnvironment('flavor');




enum EnviromentType {
  prod('prod'),
  dev('dev'),
  staging('staging');

  const EnviromentType(this.name);

  final String name;
}

class AppConfig {
  AppConfig();

  static final AppConfig _config = AppConfig();

  // Process 1 using factory constructor
  factory AppConfig.getInstance() => _config;
}
