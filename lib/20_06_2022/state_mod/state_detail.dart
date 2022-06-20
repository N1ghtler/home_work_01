import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'counter_logic.dart';

class StateDetailPage extends StatefulWidget {
  const StateDetailPage({Key? key}) : super(key: key);

  @override
  State<StateDetailPage> createState() => _StateDetailPageState();
}

class _StateDetailPageState extends State<StateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("None State Detail Page"),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtons(),
          _buildText(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
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

  Widget _buildText() {
    final CounterLogic logic = Provider.of<CounterLogic>(context);
    return Text(
      "Counter: ${logic.counter}",
      style: TextStyle(fontSize: 20),
    );
  }
}
