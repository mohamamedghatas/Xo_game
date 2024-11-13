import 'package:flutter/material.dart';
import 'package:xo_game/xo_game_screen.dart';

class PlayerScreen extends StatefulWidget {
  static const String routeName = 'player_screen';

   PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
 late String Player1Name;

  late String Player2Name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Player Screen',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(onChanged: (text){
              Player1Name=text;


            },
              decoration: InputDecoration(labelText: 'Player1 Name',labelStyle: TextStyle(color: Colors.black,)),
            ),
            TextField(onChanged: (text){

              Player2Name=text;
            },
              decoration: InputDecoration(labelText: 'Player2 Name',labelStyle: TextStyle(color: Colors.black,)),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                onPressed: (){

                  Navigator.pushNamed(context, XoGameScreen.routeName,
                  arguments :XoGameArgs(Player1Name: Player1Name, Player2Name: Player2Name) );
                }, child: Text("Let's play" ,style: TextStyle(color: Colors.white,fontSize: 20),))
          ],
        ),
      ),
    );
  }
}
class XoGameArgs{
  String Player1Name;
  String Player2Name;

  XoGameArgs({required this.Player1Name, required this.Player2Name});


}
