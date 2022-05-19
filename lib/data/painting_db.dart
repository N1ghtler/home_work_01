import 'package:home_work_01/model/painting.dart';

class Paintingdb {
  static List<Painting> loadPainting() {
    return <Painting>[
      Painting(
        id: 0,
        name: 'Brids',
        artist: 'Fantail Wrens',
        year: 2021,
      ),
      Painting(
        id: 1,
        name: 'Cascades dOuzoud, Morocco',
        artist: 'Tamara Menzi',
        year: 2,
      ),
      Painting(
        id: 2,
        name: 'Random Painting',
        artist: 'brooklyn',
        year: 2020,
      ),
      Painting(
        id: 3,
        name: 'Sea',
        artist: 'Henrik Dønnestad',
        year: 2018,
      ),
      Painting(
        id: 4,
        name: 'Flower',
        artist: 'Europeana',
        year: 2020,
      ),
      Painting(
        id: 5,
        name: 'Landscape with Cattle',
        artist: 'Europeana',
        year: 1804,
      ),
      Painting(
        id: 6,
        name: 'Monte Civetta',
        artist: 'Elijah Walton',
        year: 1867,
      ),
      Painting(
        id: 7,
        name: 'The Cannon Shot',
        artist: 'Unknown',
        year: 1680,
      ),
      Painting(
        id: 8,
        name: 'Ship',
        artist: 'Unknown',
        year: 2020,
      ),
      Painting(
        id: 9,
        name: 'Patterns',
        artist: 'Unknown',
        year: 2019,
      ),
    ];
  }
}
