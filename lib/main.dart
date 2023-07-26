import 'package:flutter/material.dart';

enum Gender { male, female }

enum Days { mon, tue, wed, thur, fri, sat, sun }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class _MyHomePageState extends State<MyHomePage> {
  Gender? gender;
  List genderInString = ["Male", "Female"];
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(
                isExpanded: true,
                hint: const Text("Gender"),
                icon: const Icon(Icons.person),
                items: Gender.values
                    .map((e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        ))
                    .toList(),
                value: gender,
                onChanged: ((gen) {
                  setState(() {
                    gender = gen;
                  });
                })),
            DropdownButton(
                items: genderInString
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                value: selectedGender,
                onChanged: ((gen) {
                  setState(() {
                    selectedGender = gen.toString();
                  });
                }))
          ],
        ),
      ),
    );
  }
}
