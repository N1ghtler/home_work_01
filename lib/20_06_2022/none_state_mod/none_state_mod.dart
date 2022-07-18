import 'package:flutter/material.dart';
import 'package:home_work_01/20_06_2022/none_state_mod/none_state_detail_page.dart';

class NoneStatePage extends StatefulWidget {
  NoneStatePage({Key? key}) : super(key: key);

  @override
  State<NoneStatePage> createState() => _NoneStatePageState();
}

class _NoneStatePageState extends State<NoneStatePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("None State Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NoneStateDetailPage(_counter),
                ),
              );
            },
            icon: const Icon(Icons.settings),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                _counter--;
              });
            },
            child: const Icon(Icons.remove)),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                _counter++;
              });
            },
            child: const Icon(Icons.add))
      ],
    );
  }

  Widget _dispaynumber() {
    return Text(
      "Counter: $_counter",
      style: const TextStyle(fontSize: 20),
    );
  }
}
