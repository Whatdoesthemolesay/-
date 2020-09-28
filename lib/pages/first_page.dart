import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testovoe_zadanie/models/get_token.dart';
import 'package:testovoe_zadanie/models/regular_post.dart';
import 'package:testovoe_zadanie/models/summary_github_post.dart';
import 'package:testovoe_zadanie/pages/second_page.dart';
import 'package:testovoe_zadanie/services/post_get_services.dart';

class FirstPage extends StatefulWidget{

  static SummaryGitHubPost summaryGitHubPost = new SummaryGitHubPost();
  static String data;

  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {


  final PostServices service = new PostServices();
  GlobalKey<FormState> _formKey = new GlobalKey();
  RegularPost _regularPost = new RegularPost();
  TokenPostGetter tokenPostGetter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
          title: Text('Ввод данных',
            style: TextStyle(
              color: Colors.white,
            ),)
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              new TextFormField(
                  keyboardType:
                  TextInputType.name,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Пожалуйста, введите имя";
                    }
                    return null;
                  },
                  onSaved: (String inValue) {
                    this._regularPost.firstName = inValue;
                    FirstPage.summaryGitHubPost.firstName = inValue;
                  },
                  decoration: InputDecoration(
                    hintText: "Имя",
                  )
              ),
              new TextFormField(
                  keyboardType:
                  TextInputType.name,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Пожалуйста, введите фамилию";
                    }
                    return null;
                  },
                  onSaved: (String inValue) {
                    this._regularPost.lastName = inValue;
                    FirstPage.summaryGitHubPost.lastName = inValue;
                  },
                  decoration: InputDecoration(
                    hintText: "Фамилия",
                  )
              ),
              new TextFormField(
                  keyboardType:
                  TextInputType.number,
                  validator: (String inValue) {
                    if (inValue.length < 10) {
                      return "Пожалуйста, введите номер телефона";
                    }
                    return null;
                  },
                  onSaved: (String inValue) {
                    this._regularPost.phone = inValue;
                    FirstPage.summaryGitHubPost.phone = inValue;
                  },
                  decoration: InputDecoration(
                    hintText: "Номер телефона",
                  )
              ),
              new TextFormField(
                  keyboardType:
                  TextInputType.emailAddress,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Пожалуйста, введите почтовый адрес";
                    }
                    String p = "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                    RegExp regExp = new RegExp(p);

                    if (regExp.hasMatch(inValue)) return null;

                    return 'Это не E-mail';
                  },
                  onSaved: (String inValue) {
                    this._regularPost.email = inValue;
                    FirstPage.summaryGitHubPost.email = inValue;
                  },
                  decoration: InputDecoration(
                    hintText: "Почтовый адрес",
                  )
              ),
              new Expanded(
                child: Align(
                  alignment: Alignment(0.0, 0.7),
                  child: RaisedButton(
                    child: Text('ПОЛУЧИТЬ КЛЮЧ'),
                    disabledColor: Colors.orange,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        tokenPostGetter = await service.createAlbum(_regularPost);
                        FirstPage.data = await tokenPostGetter.data;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}