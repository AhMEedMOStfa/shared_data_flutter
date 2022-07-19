import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OutPutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OutputStateScreen();
  }
}

class OutputStateScreen extends State<OutPutScreen> {
  String name = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieve();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                '$name',
                style: TextStyle(
                  fontSize: 34,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InputBtn('Input Screen'),
            ],
          ),
        ),
      ),
    );
  }

  Widget InputBtn(String text) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('$text'),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
    );
  }

  void retrieve() async {
    var shared = await SharedPreferences.getInstance();
    var value = shared.getString('key');
    setState(() {
      this.name = value ?? '';
    });
  }
}

