import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputStateScreen();
  }
}

class InputStateScreen extends State<InputScreen> {
      TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shared Preferences',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                field('Your Name'),
                SizedBox(
                  height: 20,
                ),
                OutPutBtn('Output Screen'),
                SizedBox(
                  height: 20,
                ),
                CounterBtn('counter Screen'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget field(String name) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        hintText: name,
      ),
    );
  }

  Widget OutPutBtn(String text) {
    return ElevatedButton(
      onPressed: () {
        save(controller.text);
        Navigator.pushNamed(context, '/output');
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
  Widget CounterBtn(String text) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/counter');
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('$text'),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
    );
  }
}

void save(String name) async {
  var shared = await SharedPreferences.getInstance();
  shared.setString('key', name);
}
