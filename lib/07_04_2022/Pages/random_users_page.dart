import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Logic/random_user_logic.dart';
import '../Model/random_user.dart';
import '../constants/status_constant.dart';

class RandomUsersPage extends StatefulWidget {
  RandomUsersPage({Key? key}) : super(key: key);

  @override
  State<RandomUsersPage> createState() => _RandomUsersPageState();
}

class _RandomUsersPageState extends State<RandomUsersPage> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() async {
      if (_pageController.position.maxScrollExtent ==
          _pageController.position.pixels) {
        await context.read<RandomUserLogic>().readbypage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.pink,
      title: const Text("Random User Page"),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildStatus(),
    );
  }

  Widget _buildStatus() {
    Status status = context.watch<RandomUserLogic>().status;
    switch (status) {
      case Status.none:
      case Status.loading:
        return const CircularProgressIndicator();
      case Status.error:
        return _buildError();
      case Status.done:
        return _buildDisplay();
    }
  }

  Widget _buildDisplay() {
    // RandomUserModel randomUser =
    //     context.watch<RandomUserLogic>().randomUserModel;

    List<Result> resultList = context.watch<RandomUserLogic>().resultList;

    return RefreshIndicator(
      onRefresh: () async {
        // context.read<RandomUserLogic>().setLoading();
        await context.read<RandomUserLogic>().readbypage(isRefesh: true);
      },
      child: ListView.builder(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: resultList.length + 1,
        itemBuilder: (context, index) {
          if (index < resultList.length) {
            return _buildItem(resultList[index]);
          } else {
            return Container(
                height: 50,
                alignment: Alignment.center,
                child: const Text("Loading..."));
          }
        },
      ),
    );
  }

  Widget _buildItem(Result item) {
    return Card(
      child: ListTile(
        leading: Image.network(item.picture.large),
        title: Text("${item.name.title} ${item.name.first} ${item.name.last}"),
        subtitle: Text("${item.location.city}, ${item.location.country}"),
        trailing: Text(item.nat),
      ),
    );
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, size: 30),
        const Text("No internet connection", style: TextStyle(fontSize: 20)),
        const Text("or something went wrong!", style: TextStyle(fontSize: 20)),
        ElevatedButton.icon(
          onPressed: () async {
            context.read<RandomUserLogic>().setLoading();
            await context.read<RandomUserLogic>().read();
          },
          icon: const Icon(Icons.refresh),
          label: const Text("RETRY"),
        ),
      ],
    );
  }
}
