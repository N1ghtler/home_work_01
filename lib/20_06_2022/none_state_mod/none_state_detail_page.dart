import 'package:flutter/material.dart';

class NoneStateDetailPage extends StatefulWidget {
  // const NoneStateDetailPage({Key? key}) : super(key: key);

  int counter;

  NoneStateDetailPage(this.counter);

  @override
  State<NoneStateDetailPage> createState() => _NoneStateDetailPageState();
}

class _NoneStateDetailPageState extends State<NoneStateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("None State Detail Page"),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                widget.counter--;
              });
            },
            child: const Icon(Icons.remove)),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                widget.counter++;
              });
            },
            child: const Icon(Icons.add))
      ],
    );
  }

  Widget _buildText() {
    return Text(
      "Counter: ${widget.counter}",
      style: const TextStyle(fontSize: 20),
    );
  }
}
