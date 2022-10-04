import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  // 텍스트를 전달받아서 넣어주기
  final String txt;
  final Animation<double> animation;

  const ChatMessage(
      this.txt, {
        required this.animation,
        key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: FadeTransition(
        // 투명도
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: -1,
          child: Row(
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: const CircleAvatar(child: Icon(Icons.person), backgroundColor: Colors.black),
            ),
            SizedBox(width: 20),

                Expanded(
                  child: Column(

                    children: [
                    Text("ID or NAME",
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                      Text(txt)
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
