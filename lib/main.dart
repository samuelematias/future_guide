import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          //With THEN
          onPressed: () {
            print('Future started - THEN');
            //The difference between this (using THEN)
            // and the async/await, is that
            // the function will not wait for the
            // Future to complete to continue executing.
            // It does not wait for the execution
            // of a Future to finish
            // before completing the function.
            myFuture().then((value) {
              print('Future finished - THEN');
            });
            print('Future now here');
          },

          // With async/await
          // onPressed: () async {
          //   print('Future started');
          //   // You use AWAIT option, when you want
          //   // to wait for the future to complete
          //   // before continuing the execution.
          //   // The dart then call is used when your
          //   // code can continue executing after
          //   // the future has been called.
          //   var futureValue = await myFuture();
          //   print(futureValue);
          // },
        ),
      ),
    );
  }

  // With async/await
  Future<String> myFuture() async {
    await Future.delayed(Duration(seconds: 1));
    return 'This future is complete';
  }

  // Without async/await
  //   Future<String> myFuture() {
  //   return Future.value('This future is complete');
  // }
}
