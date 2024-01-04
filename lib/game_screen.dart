import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_teste/count_down.dart';
// import 'package:mobx_app/constants.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  static String gameScreenRoute = '/game_screen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _countDown = CountDown();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _countDown.decrement());
    WidgetsBinding.instance.addPostFrameCallback((_) => _countDown.end());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor:
              _countDown.remainSeconds > 5 ? Colors.lightGreen : Colors.redAccent,
          leading: IconButton(
            icon: const Icon(Icons.info_outlined,color: Colors.white),
            onPressed: (){},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CircleAvatar(
                  //   backgroundImage: AssetImage('assets/images/avatar2.png'),
                  // ),
                  Text('Sally', style: TextStyle(color: Colors.white))
                ],
              ),
              Column(
                children: [
                  const Text('2 - 1',style:  TextStyle(color: Colors.white)),
                  Text(
                    '| ${_countDown.remainSeconds} sec | ${_countDown.timePlayed} | ${_countDown.gameOver} |',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CircleAvatar(
                  //   backgroundImage: AssetImage('assets/images/avatar1.png'),
                  // ),
                  Text('Sam', style: TextStyle(color: Colors.white))
                ],
              ),
            ],
          ),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white),
              itemBuilder: (context) => const [
                PopupMenuItem(value: 0, child: Icon(Icons.person)),
                PopupMenuItem(value: 1, child: Icon(Icons.library_books_outlined)),
                PopupMenuItem(value: 2, child: Icon(Icons.settings)),
              ],
              onSelected: (item) => {},
            ),
          ],
        ),
      );
    });
  }
}

void main() {
  runApp(const MaterialApp(
    home: GameScreen(),
  ));
}
