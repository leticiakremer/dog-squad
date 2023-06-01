import 'package:dog_squad/fatos/fato_page.dart';
import 'package:dog_squad/fatos/favoritos_page.dart';
import 'package:flutter/material.dart';

import 'fato.dart';
import 'dart:math';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',

      routes: {
        '/': (context) => const FatoPage(),
        '/favoritos': (context) => const FavoritosPage(),
      },
      // home: Container(
      //   color: const Color.fromARGB(255, 255, 255, 255),
      //   child: Column(
      //     children: [
      //       Container(
      //         margin: const EdgeInsets.only(left: 20, right: 10, top: 60),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             const Text(
      //               "Instagram",
      //               style: TextStyle(fontSize: 30, color: Colors.black),
      //             ),
      //             Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   GestureDetector(
      //                     onTap: () => {},
      //                     child: const Padding(
      //                       padding: EdgeInsets.only(left: 5, right: 10),
      //                       child: Icon(
      //                         Icons.house_outlined,
      //                         color: Colors.black,
      //                         size: 34.0,
      //                       ),
      //                     ),
      //                   ),
      //                   const Padding(
      //                     padding: EdgeInsets.only(left: 5, right: 10),
      //                     child: Icon(
      //                       Icons.add_box_outlined,
      //                       color: Colors.black,
      //                       size: 34.0,
      //                     ),
      //                   ),
      //                   const Padding(
      //                     padding: EdgeInsets.only(left: 5, right: 5),
      //                     child: Icon(
      //                       Icons.sms_outlined,
      //                       color: Colors.black,
      //                       size: 34.0,
      //                     ),
      //                   ),
      //                 ]),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // )
    );
  }
}
