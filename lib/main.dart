import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = test3FirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'test3',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('id'),
        Locale('ms'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key, this.initialPage, this.page});

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': const HomeWidget(),
      'Main_Contracts': const MainContractsWidget(),
      'Main_profilePage': const MainProfilePageWidget(),
      'myTeam': const MyTeamWidget(),
      'Main_customerList': const MainCustomerListWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.dashboard_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.dashboard_rounded,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'xdxbdj20' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_work_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.home_work_rounded,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'j08eiorc' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.account_circle,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'o3dp9tss' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.stream,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.stream,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                'smtxdnbn' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.supervised_user_circle_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.supervised_user_circle_sharp,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                '3ourv2w9' /* __ */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
