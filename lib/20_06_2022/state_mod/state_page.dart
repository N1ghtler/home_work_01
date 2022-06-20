import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'counter_logic.dart';
import 'state_detail.dart';

class StatePage extends StatefulWidget {
  StatePage({Key? key}) : super(key: key);

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("None State Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StateDetailPage(),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: _NoneStatePageBody(),
    );
  }

  Widget _NoneStatePageBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_bottons(), _dispaynumber()],
    );
  }

  Widget _bottons() {
    final CounterLogic logic = Provider.of<CounterLogic>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              logic.decrease();
            },
            child: Icon(Icons.remove)),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              logic.increase();
            },
            child: Icon(Icons.add))
      ],
    );
  }

  Widget _dispaynumber() {
    final CounterLogic logic = Provider.of<CounterLogic>(context);
    return Text(
      "Counter: ${logic.counter}",
      style: TextStyle(fontSize: 20),
    );
  }
}
