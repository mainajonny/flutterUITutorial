import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nash_mini/Screens/Bloc/counterBloc.dart';
import 'package:nash_mini/Screens/home/home_screen.dart';
import 'package:nash_mini/constants.dart';
import 'package:nash_mini/routes.dart';

void main() {
  MultiBlocProvider(
    providers: [
      BlocProvider<CounterBloc>(
        create: (BuildContext context) => CounterBloc(),
      ),
    ],
    child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        accentColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        fontFamily: "Muli",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColorBlack),
          bodyText2: TextStyle(color: kTextColorGrey),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}


//##############################################################################################################
// import 'package:flutter/material.dart';
// import 'package:future_progress_dialog/future_progress_dialog.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ExampleHome(),
//     );
//   }
// }

// class ExampleHome extends StatelessWidget {
//   Future getFuture() {
//     return Future(() async {
//       await Future.delayed(Duration(seconds: 5));
//       return 'Hello, Future Progress Dialog!';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Future Progress Dialog'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                   showProgress(context);
//                 },
//                 child: Text('Show Progress Dialog'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   showProgressWithoutMsg(context);
//                 },
//                 child: Text('Show Progress Dialog Without Message'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   showProgressWithCustomProgress(context);
//                 },
//                 child: Text('Show Progress Dialog with custom progress'),
//               )
//             ],
//           ),
//         ));
//   }

//   Future<void> showProgress(BuildContext context) async {
//     var result = await showDialog(
//       context: context,
//       builder: (context) =>
//           FutureProgressDialog(getFuture(), message: Text('Loading...')),
//     );
//     showResultDialog(context, result);
//   }

//   Future<void> showProgressWithoutMsg(BuildContext context) async {
//     var result = await showDialog(
//         context: context,
//         builder: (context) => FutureProgressDialog(getFuture()));
//     showResultDialog(context, result);
//   }

//   Future<void> showProgressWithCustomProgress(BuildContext context) async {
//     var result = await showDialog(
//         context: context,
//         builder: (context) => FutureProgressDialog(
//               getFuture(),
//               progress: _CustomProgress(),
//             ));

//     showResultDialog(context, result);
//   }

//   void showResultDialog(BuildContext context, String result) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Text(result),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('OK'),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _CustomProgress extends StatefulWidget {
//   const _CustomProgress({
//     Key? key,
//   }) : super(key: key);

//   @override
//   __CustomProgressState createState() => __CustomProgressState();
// }

// class __CustomProgressState extends State<_CustomProgress>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//         value: 0.0, duration: Duration(milliseconds: 1000), vsync: this);
//     controller.repeat();
//   }

//   @override
//   void dispose() {
//     if (controller != null) {
//       controller.stop();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: AnimatedIcon(
//         icon: AnimatedIcons.add_event,
//         progress: controller,
//       ),
//     );
//   }
// }


//#########################################################################################################
// import 'package:flutter/material.dart';
// import 'package:sn_progress_dialog/sn_progress_dialog.dart';

// void main() {
//   runApp(MyExample());
// }

// class MyExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   _normalProgress(context) async {
//     /// Create progress dialog
//     ProgressDialog pd = ProgressDialog(context: context);

//     /// Set options
//     /// Max and msg required
//     pd.show(
//       max: 100,
//       msg: 'File Downloading...',
//       progressBgColor: Colors.transparent,
//     );
//     for (int i = 0; i <= 100; i++) {
//       /// You don't need to update state, just pass the value.
//       /// Only value required
//       pd.update(value: i);
//       i++;
//       await Future.delayed(Duration(milliseconds: 100));
//     }
//   }

//   _valuableProgress(context) async {
//     ProgressDialog pd = ProgressDialog(context: context);

//     pd.show(
//       max: 100,
//       msg: 'File Downloading...',

//       /// Assign the type of progress bar.
//       progressType: ProgressType.valuable,
//     );
//     for (int i = 0; i <= 100; i++) {
//       pd.update(value: i);
//       i++;
//       await Future.delayed(Duration(milliseconds: 100));
//     }
//   }

//   _preparingProgress(context) async {
//     ProgressDialog pd = ProgressDialog(context: context);

//     /// show the state of preparation first.
//     pd.show(
//       max: 100,
//       msg: 'Preparing Download...',
//       progressType: ProgressType.valuable,
//     );

//     /// Added to test late loading starts
//     await Future.delayed(Duration(milliseconds: 3000));
//     for (int i = 0; i <= 100; i++) {
//       /// You can indicate here that the download has started.
//       pd.update(value: i, msg: 'File Downloading...');
//       i++;
//       await Future.delayed(Duration(milliseconds: 100));
//     }
//   }

//   _customProgress(context) async {
//     ProgressDialog pd = ProgressDialog(context: context);

//     /// show the state of preparation first.
//     pd.show(
//         max: 100,
//         msg: 'Preparing Download...',
//         progressType: ProgressType.valuable,
//         backgroundColor: Color(0xff212121),
//         progressValueColor: Color(0xff3550B4),
//         progressBgColor: Colors.white70,
//         msgColor: Colors.white,
//         valueColor: Colors.white);

//     /// Added to test late loading starts
//     await Future.delayed(Duration(milliseconds: 3000));
//     for (int i = 0; i <= 100; i++) {
//       /// You can indicate here that the download has started.
//       pd.update(value: i, msg: 'File Downloading...');
//       i++;
//       await Future.delayed(Duration(milliseconds: 100));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text(
//                   'Sn Progress Example',
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               MaterialButton(
//                   color: Color(0xfff7f7f7),
//                   child: Text('Normal Progress'),
//                   onPressed: () {
//                     _normalProgress(context);
//                   }),
//               MaterialButton(
//                   color: Color(0xfff7f7f7),
//                   child: Text('Valuable Progress'),
//                   onPressed: () {
//                     _valuableProgress(context);
//                   }),
//               MaterialButton(
//                   color: Color(0xfff7f7f7),
//                   child: Text('Preparing Progress'),
//                   onPressed: () {
//                     _preparingProgress(context);
//                   }),
//               MaterialButton(
//                   color: Color(0xfff7f7f7),
//                   child: Text('Custom Progress'),
//                   onPressed: () {
//                     _customProgress(context);
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }