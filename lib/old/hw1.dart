import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_work_01/data/painting_db.dart';
import 'package:home_work_01/model/painting.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Card> _buildPainting() {
    List<Painting> paintings = Paintingdb.loadPainting();

    if (paintings.isEmpty) {
      return const <Card>[];
    }

    return paintings.map((painting) {
      String picName = painting.name;
      String artisName = painting.artist;
      int yearMade = painting.year;
      return Card(
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 18 / 10,
                child: Image.asset(
                  painting.assetPackage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        picName,
                        style: GoogleFonts.pacifico(
                            textStyle: const TextStyle(
                          color: Color.fromARGB(255, 21, 35, 47),
                        )),
                        maxLines: 1,
                      ),
                      Text(
                        'Artis: $artisName',
                        style: GoogleFonts.actor(
                            textStyle: const TextStyle(
                          color: Colors.black,
                        )),
                      ),
                      Text(
                        'Year: $yearMade',
                        style: GoogleFonts.smooch(
                            textStyle: const TextStyle(
                          color: Color.fromARGB(255, 68, 16, 34),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.panorama_outlined),
        title: const Center(
          child: Text('Home Work'),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.person_pin))
        ],
      ),
      // body: StaggeredGrid.count(
      //   crossAxisCount: 2,
      //   children: _buildPainting(),
      // ),x
      body: GridView.count(
        crossAxisCount: 2,
        children: _buildPainting(),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
