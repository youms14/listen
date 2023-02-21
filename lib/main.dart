import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:listen/bulletin_page/bulletin_page.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'api/bulletins_api_controller.dart';
import 'bulletin_page/components/custom_appbar_bull.dart';
import 'bulletin_page/controllers/swith_bull_component_controller.dart';
import 'configuration_pages/architec_page.dart';
import 'configuration_pages/begin_page.dart';
import 'configuration_pages/controllers/question_controller.dart';
import 'intro_page.dart';
import 'main_page/components/custom_appbar.dart';

import 'main_page/controllers/custom_app_controller.dart';
import 'main_page/main_page.dart';
import 'viewer_page/components/custom_appbar_viewer.dart';
import 'viewer_page/syncfusion_viewer.dart';
import 'viewer_page/viewer_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  Get.put(CustomAppBar());
  Get.put(CustomAppBarBull());
  Get.put(CustomAppController());
  Get.put(CustomAppBarViewer());
  Get.put(SwitchBullComponentController());
  Get.put(BulletinApiController());
  Get.put(QuestionController());

  runApp(const MyApp());
}

// this will be used as notification channel id
const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 888;

Future<void> initializeService() async {
  final backgroundService = FlutterBackgroundService();
  //optional
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    notificationChannelId, // id
    'MY FOREGROUND SERVICE', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high, // importance must be at low or higher level
    playSound: true,
    enableLights: true,
    enableVibration: true,
  );
//flutter_local_notification
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isIOS) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await backgroundService.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: false,

      notificationChannelId:
          notificationChannelId, // this must match with notification channel you created above.
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: notificationId,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );
  backgroundService.startService();
}

bool isReceive = false;
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.reload();
  final log = preferences.getStringList('log') ?? <String>[];
  log.add(DateTime.now().toIso8601String());
  await preferences.setStringList('log', log);

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("hello", "world");

  /// OPTIONAL when use custom notification
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  //void connectToServer() {}

  // bring to foreground
  // Timer.periodic(const Duration(seconds: 5), (timer) async {
  if (service is AndroidServiceInstance) {
    if (await service.isForegroundService()) {
      // flutterLocalNotificationsPlugin.show(
      //   notificationId,
      //   'COOL SERVICE',
      //   'Votre Net à percevoir ce mois ${DateTime.now()}',
      //   const NotificationDetails(
      //     android: AndroidNotificationDetails(
      //       notificationChannelId,
      //       'MY FOREGROUND SERVICE',
      //       icon: 'ic_bg_service_small',
      //       ongoing: true,
      //     ),
      //   ),
      // );
    }
  }

  Socket socket = io('http://10.0.2.2:4000');
  if (!isReceive) {
    print("=================FONCTION DE CONNEXION========");
    var nslogger = Logger(printer: PrettyPrinter(methodCount: 0));

    try {
      // Configure socket transports must be sepecified
      //192.168.43.112|10.100.212.6(CENADI)10.100.212.106

      // socket = io('http://10.100.212.106:3000', <String, dynamic>{
      //   'transports': ['websocket'],
      //   'autoConnect': true,
      // });

      socket = io(
          'http://10.100.212.106:4000',
          OptionBuilder()
              .setTransports(['websocket'])
              .setExtraHeaders(
                  {'Connection': 'upgrade', 'Upgrade': 'websocket'})
              .enableReconnection()
              .setReconnectionDelay(1)
              .enableForceNew()
              .build());

      //192.168.43.212
      // Connect to websocket
      socket.connect();

      //quand la connexion est établie, le callback onConnect() est lancé.
      socket.onConnect((_) {
        print("===)))))))))))(((((((())))))))========");
        nslogger.d('Connection avec le serveur Node établie.');

        socket.on('connect', (_) => nslogger.w('connect: ${socket.id}'));

        // JE NOTIFIE LE SERVEUR QUE JE SUIS DISPOSE A RECEVOIR LE MESSAGE
        socket.emit('message', "AVAILABLE_CLIENT");
        socket.on(
            'message',
            (_) => {
                  // ignore: avoid_print
                  print(
                      "=======================Canal Message======================================"),
                  nslogger.d(_),
                  if (_ != "NOT_AVAILABLE")
                    {
                      flutterLocalNotificationsPlugin.show(
                        notificationId,
                        'VOTRE SALAIRE',
                        '$_',
                        const NotificationDetails(
                          android: AndroidNotificationDetails(
                            notificationChannelId,
                            'MY FOREGROUND SERVICE',
                            icon: 'ic_bg_service_small',
                            ongoing: true,
                          ),
                        ),
                      ),
                      isReceive = true,
                      socket.emit('message', "ACKNOWLEDGE"),
                    }
                });

        socket.on('disconnect', (_) => print('disconnect'));
        socket.on('fromServer', (_) => print(_));
      });

      socket.onDisconnect((_) => print('Connection Disconnection'));
      socket.onConnectError((err) => print(err));
      socket.onError((err) => print(err));
    } catch (e) {
      print(e.toString());
    }
  } else {
    socket.disconnect();
    socket.dispose();
    service.invoke("stopService");
  }

  // socket.disconnect();
  // socket.dispose();

  /// you can see this log in logcat
  print('Arriere plan en cours d\'execution.......: ${DateTime.now()}');

  // test using external plugin
  final deviceInfo = DeviceInfoPlugin();
  String? device;
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    device = androidInfo.model;
  }

  if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    device = iosInfo.model;
  }

  service.invoke(
    'update',
    {
      "current_date": DateTime.now().toIso8601String(),
      "device": device,
    },
  );
  //});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterBackgroundService().invoke("setAsBackground");
    return GetMaterialApp(
      title: 'ebull',
      getPages: [
        GetPage(
          name: "/main",
          // page: () => MainPage(scaffoldKey: _scaffoldKeyHome),
          page: () => MainPage(),
          //transition: Transition.leftToRight,

          // transitionDuration: const Duration(milliseconds: 100),
        ),
        GetPage(
          name: "/bulletin",
          page: () => BulletinPage(),
        ),
        GetPage(
          name: "/viewerpdf",
          page: () => SyncfusionViewer(),
        ),
        GetPage(
          name: "/intro",
          page: () => IntroPage(),
        ),
        GetPage(
          name: "/begin",
          page: () => BeginPage(),
        ),
        GetPage(
          name: "/architec",
          page: () => ArchitecPage(),
        ),
      ],
      initialRoute: "/architec",
    );
  }
}
//ViewerPdfPage
//SyncfusionViewer

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String text = "Stop Service";

//   @override
//   Widget build(BuildContext context) {
//     FlutterBackgroundService().invoke("setAsBackground");
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Service de l\'Application'),
//         ),
//         body: Column(
//           children: [
//             StreamBuilder<Map<String, dynamic>?>(
//               stream: FlutterBackgroundService().on('update'),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 final data = snapshot.data!;
//                 String? device = data["device"];
//                 DateTime? date = DateTime.tryParse(data["current_date"]);
//                 return Column(
//                   children: [
//                     Text(device ?? 'Unknown'),
//                     Text(date.toString()),
//                   ],
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Foreground Mode"),
//               onPressed: () {
//                 FlutterBackgroundService().invoke("setAsForeground");
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Background Mode"),
//               onPressed: () {
//                 FlutterBackgroundService().invoke("setAsBackground");
//               },
//             ),
//             ElevatedButton(
//               child: Text(text),
//               onPressed: () async {
//                 final service = FlutterBackgroundService();
//                 var isRunning = await service.isRunning();
//                 if (isRunning) {
//                   service.invoke("stopService");
//                 } else {
//                   service.startService();
//                 }

//                 if (!isRunning) {
//                   text = 'Stop Service';
//                 } else {
//                   text = 'Start Service';
//                 }
//                 setState(() {});
//               },
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           child: const Icon(Icons.play_arrow),
//         ),
//       ),
//     );
//   }
// }
