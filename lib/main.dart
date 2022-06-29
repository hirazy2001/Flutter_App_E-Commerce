import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_state.dart';
import 'package:flutter_app_e_commerce/src/bloc/internet/internet_cubit.dart';
import 'package:flutter_app_e_commerce/src/bloc/otp/otp_bloc.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';
import 'package:flutter_app_e_commerce/src/common/locator.dart';
import 'package:flutter_app_e_commerce/src/config/app_routes.dart';
import 'package:flutter_app_e_commerce/src/my_bloc_observer.dart';
import 'package:flutter_app_e_commerce/src/screens/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  setupLocator();

  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.instance.webInitialize(
      appId: Constants.FACEBOOK_APP_ID,
      cookie: true,
      xfbml: true,
      version: "v13.0",
    );
  }

  await SentryFlutter.init(
    (options) {
      options.dsn = '';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => BlocOverrides.runZoned(() => runApp(MyApp()),
        blocObserver: MyBlocObserver()),
  );

  // AssetPicker.registerObserve();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Hello");
    // MultiRepositoryProvider
    return MultiBlocProvider(
        providers: [
          _configureAuthenticationBloc(),
          _configureInternetConnection(),
          _configureOtpBloc()
        ],
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('nn'),
                ],
                localizationsDelegates: [

                ],
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                onGenerateRoute: AppRoutes.generateRoute,
                home: SplashScreen());
            // BlocBuilder<AuthenticationBloc, AuthenticationState>(
            //   builder: (context, state) {
            //     if (state is AuthenticatedState) {
            //       return HomeScreen();
            //     } else if (state is UnAuthenticatedState) {
            //       return AuthenticationScreen();
            //     } else if (state is FirstOpenApp) {
            //       return OnBoardingScreen();
            //     }
            //     return ErrorScreen();
            //   },
            // ));
          },
        ));
  }

  BlocProvider<AuthenticationBloc> _configureAuthenticationBloc() {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
          // UninitializedState(),
          // RepositoryProvider.of<UserAuthenticationRespository>(context),
          // RepositoryProvider.of<ApiClient>(context),
          )
        // ..add(
        //   AppStarted(),
        // ),
        );
  }

  BlocProvider<OtpBloc> _configureOtpBloc() {
    return BlocProvider<OtpBloc>(
        create: (context) => OtpBloc(
            // UninitializedState(),
            // RepositoryProvider.of<UserAuthenticationRespository>(context),
            // RepositoryProvider.of<ApiClient>(context),
            ));
  }

  BlocProvider<InternetCubit> _configureInternetConnection() {
    return BlocProvider<InternetCubit>(
        create: (context) => InternetCubit(connectivity: Connectivity()
            // UninitializedState(),
            // RepositoryProvider.of<UserAuthenticationRespository>(context),
            // RepositoryProvider.of<ApiClient>(context),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
