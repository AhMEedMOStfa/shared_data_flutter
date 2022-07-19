import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterStateScreen();
  }
}

class CounterStateScreen extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterProvider>(context , listen: false).incrementCount();
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child:
                      Text('${Provider.of<CounterProvider>(context).count}')),
              ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context , listen: false).decrementCount();
                },
                child: Icon(Icons.remove),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context , listen: false).resetCount();
                },
                child: Icon(Icons.lock_reset),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: CounterScreen(),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int count = 0;
  void incrementCount() {
    count++;
    notifyListeners();
  }

  void decrementCount() {
    count--;
    notifyListeners();
  }

  void resetCount() {
    count = 0;
    notifyListeners();
  }
}
