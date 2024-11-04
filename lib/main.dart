import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/screens/Sorteos.dart';

import 'screens/Home.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("es"),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      theme: theme(),
      title: 'Events',
      home: const SplashPage(),
    );

  }

}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {


    super.initState();
    initialization();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: COLOR_ACCENT,
        extendBody: true,

        body: SizedBox(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                const Center(

                  child: CircularProgressIndicator(color: COLOR_BACKGROUND,),
                ),

              ],
            )


        )

    );

  }

  initialization() async {

    await Future.delayed(const Duration(seconds: 1)); // Retraso de 2 segundos antes de la navegación

    if(MediaQuery.of(context).size.width > 450){

      if(mounted){
        goToClear(context, const SorteosPage());
      }

    }else{

      if(mounted){
        goToClear(context, const SorteosPage());
      }

    }

  }
}