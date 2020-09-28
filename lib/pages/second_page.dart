import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testovoe_zadanie/models/registration_get.dart';
import 'package:testovoe_zadanie/services/post_get_services.dart';

import 'first_page.dart';

class SecondPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SecondPage1(),
    );
  }
}

class SecondPage1 extends StatefulWidget{


  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage1>{

  GlobalKey<FormState> _formKey = new GlobalKey();
  PostServices service = new PostServices();
  Registration registration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Отправка данных',
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
              TextFormField(
                  keyboardType:
                  TextInputType.url,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Введите ссылку на исходный код приложения";
                    }
                    return null;
                  },
                  onSaved: (String inValue) {
                    FirstPage.summaryGitHubPost.gitHub = inValue;
                  },
                  decoration: InputDecoration(
                    hintText: "Ссылка на gitHub",
                  )
              ),
              TextFormField(
                  keyboardType:
                  TextInputType.url,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Введите ссылку на ваше резюме";
                    }
                    return null;
                  },
                  onSaved: (String inValue) {
                    FirstPage.summaryGitHubPost.summary = inValue;
                  },
                  decoration: InputDecoration(
                    hintText: "Ссылка на резюме",
                  )
              ),
              Expanded(
                child: Align(
                    alignment: Alignment(0.0, 0.7),
                    child: RaisedButton(
                      child: Text('ЗАРЕГИСТРИРОВАТЬСЯ'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          registration = await service.Register(
                              FirstPage.data, FirstPage.summaryGitHubPost);
                          if (registration.code == 1) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(registration.message)));
                          }
                          else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Регистрация завершена')));
                          }
                        }
                      },
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}