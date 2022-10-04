// stless 써서 만들고 빨간 줄 클릭 후 alt + enter 눌러서 material 다트 생성
import 'package:firtst/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//위젯 자체가 계속 변하는 위젯이므로 stateless >> stateful 위젯으로 변경
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // AnimatedList키 설정
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();

  // Texteditingcontroller를 통해 텍스트를 가져올 수 있음
  TextEditingController _textEditingController = TextEditingController();

  // 채팅 ui 연결하기
  List<String> _chats = [];

// scaffold 위젯안에 앱바 넣기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chatting"),
        backgroundColor: Colors.black,
      ),
      // 앱바 안에 컨테이너 만들어주고,row와 비슷한 column으로 감싸주기
      body: Column(
        children: [
          Expanded(
              //텍스트 애니메이션 추가
              child: AnimatedList(
            // AnimatedList의 상태를 키가 가지고 있는다.
            key: _animListKey,
            //텍스트 순서가 위에서 아래로 보이는걸 역으로 바꿔줌
            reverse: true,
            itemBuilder: _buildItem,
            //},
          )),
          Container(
            //padding을 써서 메세지 입력창 글씨 위치를 왼쪽에 10만큼 갭을 줘서 옮김
            padding: EdgeInsets.only(left: 10, right: 5.0),


            child: Row(
              children: [
                //expanded로 텍스트필드 감싸주면 로우안에서 텍스트 필드 부분을 제외한 나머지 부분을 다 이 위젯으로 차지
                Expanded(
                  child: TextField(
                    //텍스트 필드에 texteditingcontroller 전달, decoration과 밑 부분은 키패트의 전송버튼에 관여
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: " 메세지 입력",

                    ),

                    //    onSubmitted: (String text){
                    //      print("onSubmintted: $text"); };

                    //위 구문처럼 사용하지 않고 같은 스트링 값이라 바로 핸들 서브밋으로 받아올 수 있음
                    onSubmitted: _handleSubmitted,
                  ),
                ),

                // 버튼과 텍스트 사이의 간격
                SizedBox(
                  width: 8.0,
                ),
                TextButton(
                    onPressed: () {
                      //텍스트 컨트롤러와 연결된 텍스트 필드에서 텍스트를 가져와서 프린트
                      // print(_textEditingController.text);

                      // handle submitted 전달
                      _handleSubmitted(_textEditingController.text);
                    },
                    child: ElevatedButton.icon(
                        onPressed: () =>
                            _handleSubmitted(_textEditingController.text),
                        icon: Icon(Icons.send, color: Colors.black),
                        label: Text(""),
                        style: TextButton.styleFrom(
                            minimumSize: Size(20, 40),
                            backgroundColor: Colors.white)))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(context, index, animation) {
    return ChatMessage(_chats[index], animation: animation);
  }

  // decoration: InputDecoration(hintText: "메세지 입력창"),print(_textEditingController.text);
  // 위가 같은 부분이므로 하나로 묶어준다.

  void _handleSubmitted(String text) {
    //로거 임포트후 디버깅
    Logger().d(text);

    //텍스트 입력한 뒤 텍스트 삭제하기
    _textEditingController.clear();
    _chats.insert(0, text);
    _animListKey.currentState!.insertItem(0);
  }
}
