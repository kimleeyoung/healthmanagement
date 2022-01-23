import 'package:flutter/material.dart';
import 'package:flutter_firebase/member/member_main.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'main.dart';

class Login2Page extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login2Page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isKakaoTalkInstalled = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  static final double _cornerRadius = 8.0;
  OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
  );

  @override
  void initState() {
    _initKakaoTalkInstalled();
    super.initState();
  }

  _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    print('kakao Install : ' + installed.toString());

    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);
      print(token);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Mainscreen(),
          ));
    } catch (e) {
      print(e.toString());
    }
  }

  _loginWithKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);
    } catch (e) {
      print(e.toString());
    }
  }

  _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원로그인'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              SizedBox(
                height: 200,
              ),
              _buildTextFormField("아이디", _emailController),
              SizedBox(
                height: 8,
              ),
              _buildTextFormField("비밀번호", _passwordController),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 50,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("입력값이 맞다");
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Membermain()),
                    );
                  },
                  color: Colors.black26,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_cornerRadius)),
                  padding: EdgeInsets.all(16),
                  child: Text("로그인", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Divider(
                height: 40,
                thickness: 1,
                color: Colors.black,
                indent: 14,
                endIndent: 14,
              ),
              SizedBox(
                height: 3,
              ),
              InkWell(
                onTap: () => _isKakaoTalkInstalled
                    ? _loginWithTalk()
                    : _loginWithKakao(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow),
                  child: Row(
                    children: [
                      Icon(Icons.chat_bubble, color: Colors.black54),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "카카오 로그인",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 40,
                thickness: 1,
                color: Colors.black,
                indent: 14,
                endIndent: 14,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  buildButton('assets/google.jpeg', () {}),
                  buildButton('assets/facebook.png', () {}),
                  buildButton('assets/kakao.jpeg', () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildButton(String imagePath, Function onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white10),
      child: IconButton(
        onPressed: () {},
        icon: ImageIcon(AssetImage(imagePath)),
      ),
    );
  }

  TextFormField _buildTextFormField(
      String hintText, TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      // ignore: missing_return
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "입력창이 비었습니다.";
        }
      },
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: hintText,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
