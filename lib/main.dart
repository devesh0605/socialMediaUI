import 'package:flutter/material.dart';
import 'package:social_media_ui/screens/github_jobs.dart';
import 'package:social_media_ui/screens/login_screen.dart';
import 'package:flutter/services.dart';

void main() {
  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Social UI',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginScreen(),
    );
    //home: GitHubJobs());
  }
}

// class OrderPage extends StatefulWidget {
//   @override
//   _OrderPageState createState() => _OrderPageState();
// }
//
// class _OrderPageState extends State<OrderPage> {
//   bool isShowing = true;
//   int blueText = 0;
//   int redText = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RaisedButton(
//               child: (Text('Delete blue')),
//               onPressed: () {
//                 setState(() {
//                   isShowing = false;
//                 });
//               },
//             ),
//             if (isShowing)
//               FlatButton(
//                 onPressed: () {
//                   setState(() {
//                     blueText++;
//                   });
//                 },
//                 color: Colors.blue,
//                 child: Text('$blueText'),
//               ),
//             FlatButton(
//               onPressed: () {
//                 setState(() {
//                   redText++;
//                 });
//               },
//               color: Colors.red,
//               child: Text('$redText'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyWidget extends StatelessWidget {
//   final personNextToMe =
//       'That reminds me about the time when I was ten and our neighbor, her name was Mrs. Mable, and she said...';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(children: [
//           Icon(Icons.airline_seat_legroom_reduced),
//           Expanded(
//             child: Text(personNextToMe),
//           ),
//           Icon(Icons.airline_seat_legroom_reduced),
//         ]),
//       ),
//     );
//   }
// }
// class Pizza {
//   final String _cheese = 'cheddar';
// }
//
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Screen1'),
//       ),
//       body: Scaffold(
//         appBar: AppBar(
//           title: Text('Screen 2'),
//         ),
//         body: Center(
//           child: Wrap(children: [
//             Chip(label: Text('I')),
//             Chip(label: Text('really')),
//             Chip(label: Text('really')),
//             Chip(label: Text('really')),
//             Chip(label: Text('really')),
//             Chip(label: Text('really')),
//             Chip(label: Text('really')),
//             Chip(label: Text('need')),
//             Chip(label: Text('a')),
//             Chip(label: Text('job')),
//           ]),
//         ),
//       ),
//     );
//   }
// }
