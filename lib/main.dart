import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationcontroller;

  @override
//In Flutter, the initState method is a lifecycle method that is called when a stateful widget is inserted into the widget tree for the first time. It's part of the State class and is used to perform one-time initialization tasks for the widget's state.

  void initState() {
    super.initState();
// we create a animate controller in initstate method. it manages animation lifecycle. vsync synchonize with h widget lifcycle
    animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
// tween defines the range of values
    animation = Tween<double>(
      begin: 100.0, // Initial size
      end: 200.0, // Final size
    ).animate(animationcontroller);
// the below begins our animation from initial state to final state.
    animationcontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Container(
                width: animation.value, // Use the animated value for width
                height: animation.value, // Use the animated value for height
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Animated Container',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        )
        //akes auto-formatting nicer for build methods.
        );
  }

  @override
  void dispose() {
    // Step 5: Dispose the AnimationController when the widget is disposed
    animationcontroller.dispose();
    super.dispose();
  }
}
//animation classes
//  Animation- represents a value that changes over time
//  Tween- defines a range of values for an animation
//  AnimationController- controlls the duraton ,forward and reverse aspects of an animation
// SingleTickerProviderStateMixin makes it easier for you to create smooth animation in your app
//When you want to make something move or change smoothly over time (like a button getting bigger or smaller), you need a special tool called an AnimationController. This tool requires another special thing called a TickerProvider to work properly.
//SingleTickerProviderStateMixin is like a quick and easy way to give your animation tool (the AnimationController) the special thing it needs (the TickerProvider). It's called "Single" because it's designed for cases where you have just one animation tool in your widget.