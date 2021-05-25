import 'package:AiRi/components/components.dart';
import 'package:AiRi/pages/main/main_page.dart';
import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  bool pwdToogle = false;
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  void _removePhone() {
    _unameController.clear();
  }

  void _removePassword() {
    _pwdController.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loginAction(BuildContext context) async {
    if ((_formKey.currentState as FormState).validate()) {
      // 验证通过表示已经登录成功
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogin', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext ctx) => MainPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _unameController.addListener(() {
      setState(() {});
    });
    _pwdController.addListener(() {
      setState(() {});
    });
    return BaseScaffold(
      appBar: MyAppBar(
        leadingType: AppBarBackType.None,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      width: 72,
                      height: 72,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'AiRi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ]),
                ),
                _buildPhoneInput(),
                SizedBox(
                  height: 20,
                ),
                _buildPasswordInput(),
                // 登录按钮
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: BottomButton(
                    text: '登录',
                    handleOk: () => _loginAction(context),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        '找回密码',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(155, 155, 155, 1),
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    SizedBox(
                      width: 1,
                      height: 16,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(color: Color.fromRGBO(217, 217, 217, 1)),
                      ),
                    ),
                    SizedBox(width: 14),
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        '新用户注册',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(18, 18, 18, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 号码
  Widget _buildPhoneInput() {
    return TextFormField(
        controller: _unameController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () => _removePhone(),
            child: _unameController.text != '' ? Icon(Icons.cancel, size: 18) : SizedBox(),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
          filled: true,
          fillColor: Color.fromRGBO(245, 247, 247, 1),
          hintText: "请输入手机号码",
          prefixIcon: Image(
            image: AssetImage("assets/images/login/phone.png"),
          ),
        ),
        cursorColor: AppColors.primaryColor,
        // 校验用户名
        validator: (v) {
          String t = v ?? '';
          return t.trim().length > 0 ? null : "用户名不能为空";
        });
  }

  // 密码
  Widget _buildPasswordInput() {
    return TextFormField(
        controller: _pwdController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _pwdController.text != ''
                  ? GestureDetector(onTap: () => _removePassword(), child: Icon(Icons.cancel, size: 18))
                  : SizedBox(),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    pwdToogle = !pwdToogle;
                  })
                },
                child: Icon(Icons.remove_red_eye, size: 18),
              ),
              SizedBox(width: 15),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
          filled: true,
          fillColor: Color.fromRGBO(245, 247, 247, 1),
          hintText: "请输入密码",
          prefixIcon: Image(
            image: AssetImage("assets/images/login/password.png"),
          ),
        ),
        obscureText: !pwdToogle,
        cursorColor: AppColors.primaryColor,
        //校验密码
        validator: (v) {
          String t = v ?? '';
          return t.trim().length > 5 ? null : "密码不能少于6位";
        });
  }
}
