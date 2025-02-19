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
          //The difference between  using THEN
          // and the using async/await, is that
          // the function will not wait for the
          // Future to complete to continue executing.
          // It does not wait for the execution
          // of a Future to finish
          // before completing the function.

          // With time out (String)
          onPressed: () async {
            // This function allows you to do
            // is to return an actual value with the future
            // that you are expecting,
            // that's where your future value
            // won't be now aftter the execution
            // so you can still have a value based
            // on the timed out.
            // The time out its become pretty useful if you want
            // to do things like retries,
            // you can return your retry account
            // and you can continually trying until
            // you have a exhaust your retries.
            var futureValue = await myStringTimeOutFuture()
                .timeout(Duration(seconds: 2), onTimeout: () {
              print('This future has timed out');
              return 'This is my timed out value';
            });
            print('Future completed: $futureValue');
          },

          // With time out (download files)
          // onPressed: () async {
          //   runTimeout();
          // },

          // With multiple futures
          // onPressed: () {
          //   runMultipleFutures();
          // },

          // With error handling (async/wait catchError)
          // onPressed: () {
          //   print('Future started - THEN');
          //   var value = myFuture().catchError((onError) {
          //     print(onError);
          //   });
          //   print('Future now here');
          // },

          // With error handling (catchError)
          // onPressed: () {
          //   print('Future started - THEN');
          //   myFuture().then((value) {
          //     print('Future finished - THEN');
          //   }).catchError((onError) {
          //     print(onError);
          //   });
          //   print('Future now here');
          // },

          // With error handling (onError)
          // onPressed: () {
          //   print('Future started - THEN');
          //   myFuture().then((value) {
          //     print('Future finished - THEN');
          //   }, onError: (error) {
          //     print(error);
          //   });
          //   print('Future now here');
          // },

          // With THEN
          // onPressed: () {
          //   print('Future started - THEN');
          //   myFuture().then((value) {
          //     print('Future finished - THEN');
          //   });
          //   print('Future now here');
          // },

          // With async/await
          // onPressed: () async {
          //   print('Future started');
          //   var futureValue = await myFuture();
          //   print(futureValue);
          // },
        ),
      ),
    );
  }

  // With time out (String)
  Future<String> myStringTimeOutFuture() async {
    print('future started');
    await Future.delayed(Duration(seconds: 5));
    return 'future complete';
  }

  // With time out (download files)
  // Future<bool> myTimeOutFuture(int id, int duration) async {
  //   await Future.delayed(Duration(seconds: duration));
  //   print('Delay complete for Future $id');
  //   return true;
  // }

  // With time out (download files)
  // Future runTimeout() async {
  //   await myTimeOutFuture(0, 10).timeout(Duration(seconds: 2), onTimeout: () {
  //     print('0 timed out');
  //     return false;
  //   });
  // }

  // Future to run multiple futures
  // Future<bool> downloadFile(int id, int duration) async {
  //   await Future.delayed(Duration(seconds: duration));
  //   print('Delay complete for Future $id');
  //   return true;
  // }

  // Running multiple futures
  // Future runMultipleFutures() async {
  //   // Create list of multiple futures
  //   var futures = List<Future>();
  //   for (int i = 0; i < 10; i++) {
  //     futures.add(downloadFile(i, Random(i).nextInt(10)));
  //   }

  //   print('start downloads');
  //   // Waif for all futures to complete
  //   await Future.wait(futures);

  //   // We're done with all futures execution
  //   print('All the futures has completed');
  // }

  // With error handling (throw Exception)
  // Future<String> myFuture() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   throw Exception('Exception form error.');
  // }

  // With error handling (Future.error)
  // Future<String> myFuture() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return Future.error('Error from return');
  // }

  // With async/await
  // Future<String> myFuture() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return 'This future is complete';
  // }

  // Without async/await
  //   Future<String> myFuture() {
  //   return Future.value('This future is complete');
  // }
}
