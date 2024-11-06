import 'dart:async';

class Env implements EnvVars {
  Env._();

  factory Env() => _instance;

  static final Env _instance = Env._();

  late EnvVars _vars;

  FutureOr<void> loadVars(EnvVars vars) => _vars = vars;
  @override
  String get apiToken => _vars.apiToken;

  @override
  String get baseURL => _vars.baseURL;

  @override
  String get title => _vars.title;

  @override
  String get bearerToken => _vars.bearerToken;

  @override
  String get authBaseURL => _vars.authBaseURL;

  @override
  String get fleetBaseURL => _vars.fleetBaseURL;

  @override
  String get graphBaseURL => _vars.graphBaseURL;

  @override
  String get chatURL => _vars.chatURL;

  @override
  String get contactURL => _vars.contactURL;
}

abstract class EnvVars {
  //URLSd
  String get baseURL; // parts model
  String get authBaseURL; // login and authentication
  String get graphBaseURL; // part search n catologs
  String get fleetBaseURL; // fleet management

  String get contactURL; // contact
  String get chatURL; // chat for webview

  String get apiToken;
  String get title;
  String get bearerToken;
}
