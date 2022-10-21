import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project10/providers/user_provider.dart';
import 'package:project10/resposive/mobile_screen_layout.dart';
import 'package:project10/resposive/responsive_layout.dart';
import 'package:project10/resposive/web_screen_layout.dart';
import 'package:project10/screens/login_screen.dart';
import 'package:provider/provider.dart';

///

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project10/stateManagement/blocs/Preferences_bloc.dart';
import 'package:project10/stateManagement/models/preferences.dart';
import 'package:project10/stateManagement/services/preferences_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  // final storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );
  // HydratedBlocOverrides.runZoned(
  //   () => runApp(MyApp()),
  //   storage: storage,
  // );
  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBF9ZDPsVzFTPGLMcjd7H6Bz2MbWYoikvM",
        appId: "1:898104465447:web:279b3d334f9462c93ed602",
        messagingSenderId: "898104465447",
        projectId: "main-project10",
        storageBucket: 'main-project10.appspot.com',
        measurementId: "G-VKYTSYY53E",
        authDomain: "main-project10.firebaseapp.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PreferencesCubit>(
      future: buildBloc(),
      builder: (context, blocSnapshot) {
        if (blocSnapshot.hasData && blocSnapshot.data != null) {
          return BlocProvider<PreferencesCubit>(
            create: (_) => blocSnapshot.data!,
            child: BlocBuilder<PreferencesCubit, Preferences>(
                builder: (context, preferences) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (_) => UserProvider(),
                  ),
                ],
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Instagram Clone',
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark().copyWith(
                    scaffoldBackgroundColor: Colors.black,
                    // backgroundColor: Colors.black,
                    // primaryColorDark: Colors.black,
                    // primaryColor: Colors.black,
                    //tabBarTheme:
                  ),
                  themeMode: preferences.themeMode,
                  home: StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          return const ResponsiveLayout(
                            mobileScreenLayout: MobileScreenLayout(),
                            webScreenLayout: WebScreenLayout(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('${snapshot.error}'),
                          );
                        }
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return const LoginScreen();
                    },
                  ),
                ),
              );
            }),
          );
        }

        return SizedBox.shrink();
      },
    );
  }

  Future<PreferencesCubit> buildBloc() async {
    final prefs = await SharedPreferences.getInstance();
    final service = await MyPreferencesService(prefs);
    return PreferencesCubit(service, await service.get());
  }
}
