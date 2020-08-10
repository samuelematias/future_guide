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
          onPressed: () async {
            print('Future started');
            // You use AWAIT option, when you want
            // to wait for the future to complete
            // before continuing the execution.
            // The dart then call is used when your
            // code can continue executing after
            // the future has been called.
            var futureValue = await myFuture();
            print(futureValue);
          },
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
