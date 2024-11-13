import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xo_game/player_screen.dart';

import 'button.dart';

class XoGameScreen extends StatefulWidget {
  static const String routeName = 'xo_game';


  @override
  State<XoGameScreen> createState() => _XoGameScreenState();
}

class _XoGameScreenState extends State<XoGameScreen> {
  List<String>BordButton=[

    '','','',
    '','','',
    '','',''
  ];
  int playerA=0;
  int playerB=0;


  @override
  Widget build(BuildContext context) {
    XoGameArgs args=ModalRoute.of(context)?.settings.arguments as XoGameArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Xo Game',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.Player1Name} (x)',
                      style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$playerA",
                      style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.Player2Name}(O )',
                      style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$playerB',
                      style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(text:BordButton[0] ,index: 0,onButtonClick: onButtonClick),
                Button(text:BordButton[1] ,index: 1,onButtonClick: onButtonClick ),
                Button(text:BordButton[2] ,index: 2,onButtonClick: onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(text:BordButton[3] ,index: 3,onButtonClick:onButtonClick ),
                Button(text:BordButton[4] ,index: 4,onButtonClick:onButtonClick ),
                Button(text:BordButton[5] ,index: 5,onButtonClick:onButtonClick ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(text:BordButton[6] ,index: 6,onButtonClick: onButtonClick ),
                Button(text:BordButton[7] ,index: 7,onButtonClick: onButtonClick ),
                Button(text:BordButton[8] ,index: 8,onButtonClick: onButtonClick),
              ],
            ),
          )
        ],
      ),
    );
  }

  int counter=0;

  onButtonClick (int index){
    if(BordButton[index].isNotEmpty){
      return ;
    }
if(counter%2==0){
  BordButton[index]='X';

}else{
  BordButton[index]='O';
}
counter++;
if(checkWinner('X')){


  playerA+=5;
  initBord();
}else if(checkWinner('O')){
  playerB+=5;
  initBord();
}else if(counter==9){

  initBord();
}
setState(() {

});
  }
  bool checkWinner(String symbol ){



     for(int i=0;i<9;i+=3){

       if(BordButton[i]==symbol&&
           BordButton[i+1]==symbol&&
           BordButton[i+2 ]==symbol){
         return true;
       }
     }
     for(int i=0;i<3;i++ ){
       if(BordButton[i]==symbol&&
           BordButton[i+3]==symbol&&
           BordButton[i+6 ]==symbol){
         return true;
       }

     }
     if(BordButton[0]==symbol&&
         BordButton[4]==symbol&&
         BordButton[8 ]==symbol){
       return true;
     } if(BordButton[2]==symbol&&
         BordButton[4]==symbol&&
         BordButton[6 ]==symbol){
       return true;

     }
     return false;
  }

  void initBord() {
    BordButton=[

      '','','',
      '','','',
      '','',''
    ];
    counter=0;

  }

}
