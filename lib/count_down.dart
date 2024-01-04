import 'package:mobx/mobx.dart';
import 'dart:async';

part 'count_down.g.dart';

class CountDown = _CountDown with _$CountDown;

abstract class _CountDown with Store {

  @observable
  int remainSeconds = 10;

  @observable
  String timePlayed = '1° Tempo';
  
  int cont = 0;

  @observable
  String gameOver = 'playing';

  Timer? timer1;
  Timer? timer;

  @action
  void decrement() {
      timer1 = Timer.periodic(const Duration(seconds: 1), (_) {
        remainSeconds > 0 ? remainSeconds-- : _stopTimer();
        print('Contador: $cont');
      });
  }

  @action
  void end(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (cont != 0 && remainSeconds == 0){
      _endGame();
      print(gameOver);
    }
    if (gameOver == 'Game Over'){
      timer?.cancel();
      print('Timer cancelado');
    }
    });
  }

  _stopTimer(){
    // timer?.cancel();
    // gameOver = 'Game Over';
    // remainSeconds = 15;
    if (cont == 0) {
      remainSeconds = 10;
      timePlayed = '2° Tempo';
      cont++;
    }
    else{
      remainSeconds = 0;
      timer1?.cancel();
    }
  }

  _endGame(){
    gameOver = 'Game Over';
    timePlayed = 'end time';
  }
}