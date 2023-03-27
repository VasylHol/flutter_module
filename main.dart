import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CardSlider(),
        ),
      ),
    );
  }
}

class CardSlider extends StatefulWidget {
  List<CardData> cardDataList = [
    CardData(
        imagePath:
            "https://www.bookovka.ua/232623-home_default/1984-myagkaya-oblozhka.jpg",
        cardTitle: '1984',
        description:
            'Антиутопія англійського письменника Джорджа Орвелла, написана 1948 року (у назві роману цифри 4 і 8 переставлені місцями) й опублікована 1949-го.Роман розповідає історію Вінстона Сміта і його деградації під впливом тоталітарної держави, у якій він живе. Є найвідомішою і найцитованішою антиутопією у літературі і стоїть в одному ряду з «Прекрасним новим світом» (англ. Brave new world) Олдоса Гакслі і «451° за Фаренгейтом» Рея Бредбері.'),
    CardData(
        imagePath:
            "https://i0.wp.com/vsiknygy.net.ua/wp-content/uploads/2018/03/remark-1-1-e1521705168741.jpg?fit=1024%2C768&ssl=1",
        cardTitle: 'На західному фронті без змін',
        description:
            'Антивоєнний роман німецького письменника Еріха Марії Ремарка, виданий 1929 р. У передмові до нього автор говорить: «Ця книга — не викриття і не сповідь. Це лише спроба розповісти про покоління, яке занапастила війна, про тих, хто став її жертвою, навіть якщо врятувався від снарядів».'),
    CardData(
        imagePath:
            "https://upload.wikimedia.org/wikipedia/uk/1/1e/451%C2%B0_%D0%B7%D0%B0_%D0%A4%D0%B0%D1%80%D0%B5%D0%BD%D0%B3%D0%B5%D0%B9%D1%82%D0%BE%D0%BC_%28%D0%9D%D0%B0%D0%B2%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0_%D0%BA%D0%BD%D0%B8%D0%B3%D0%B0_%E2%80%94_%D0%91%D0%BE%D0%B3%D0%B4%D0%B0%D0%BD%2C_2018%29.png",
        cardTitle: '451° за Фаренгейтом',
        description:
            '«Роман-антиутопія американського письменника Рея Бредбері в жанрі наукової фантастики, вперше опублікований у 1953 році. Роман часто розглядається, як один з найкращих його творів.[1] Роман описує майбутнє американське суспільство, в якому книги заборонені, і будь-які знайдені книжки спалюються «пожежниками».[2] Підзаголовок назви книги пояснює заголовок: «Фаренгейт 451 — температура, при якій загоряється і горить папір…» .'),
    CardData(
        imagePath:
            "https://book24.ua/upload/iblock/4e5/4e50a01815c5672d9aee93aee49f1062.jpg",
        cardTitle: 'Портрет Доріана Ґрея',
        description:
            "Роман розповідає про молодика на ім'я Доріан Ґрей, який став натурником для портрета художника Безіла Голворда. Перебуваючи під враженням від фізичної краси Доріана, Безіл невдовзі закохався у нього, вважаючи, що Доріанова краса породжує нові тенденції у його творчості."),
  ];

  CardSlider();

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  int _currentIndex = 0;

  void _previousCard() {
    setState(() {
      _currentIndex = (_currentIndex == 0)
          ? widget.cardDataList.length - 1
          : _currentIndex - 1;
    });
  }

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex == widget.cardDataList.length - 1)
          ? 0
          : _currentIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(94, 157, 212, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 550,
                width: 350,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(80, 118, 200, 1),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              widget.cardDataList[_currentIndex].imagePath,
                              width: 200,
                              height: 250,
                            ),
                          ]),
                      Row(
                        children: [
                          Text(
                            widget.cardDataList[_currentIndex].cardTitle,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.cardDataList[_currentIndex].description,
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                      ),
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: const Text('<'),
                    onPressed: _previousCard,
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 30),
                        shape: CircleBorder(),
                        backgroundColor: Color.fromARGB(255, 240, 110, 110))),
                SizedBox(width: 16.0),
                TextButton(
                    child: const Text('>'),
                    onPressed: _nextCard,
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Color.fromARGB(255, 240, 110, 110),
                      textStyle: const TextStyle(fontSize: 30),
                    )),
              ],
            ),
          ],
        ));
  }
}

class CardData {
  final String imagePath;
  final String cardTitle;
  final String description;

  CardData(
      {required this.imagePath,
      required this.cardTitle,
      required this.description});
}
