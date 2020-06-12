import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watson_assistant_v2/watson_assistant_v2.dart';

import 'Intro.dart';

class Watson extends StatefulWidget {
  Watson({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WatsonState createState() => _WatsonState();
}

class _WatsonState extends State<Watson> {
  String _text;
  WatsonAssistantV2Credential credential = WatsonAssistantV2Credential(
    version: '2020-06-13',
    username: 'apikey',
    apikey: '2DwnuMUQPhTZLrwSI0HNmH8ZolbRtF5b1G4AHyUg1Amq',
    assistantID: '886d997d-172e-4dc8-a513-6e83f752e92d',
    url: 'https://api.kr-seo.assistant.watson.cloud.ibm.com/instances/6e932cbc-6f39-4b7b-8489-17ca9fbe8ee3/v2',
  );

  WatsonAssistantApiV2 watsonAssistant;
  WatsonAssistantResponse watsonAssistantResponse;
  WatsonAssistantContext watsonAssistantContext =
  WatsonAssistantContext(context: {});

  final myController = TextEditingController();

  void _callWatsonAssistant() async {
    watsonAssistantResponse = await watsonAssistant.sendMessage(
        myController.text, watsonAssistantContext);
    setState(() {
      _text = watsonAssistantResponse.resultText;
    });
    watsonAssistantContext = watsonAssistantResponse.context;
    myController.clear();
  }

  @override
  void initState() {
    super.initState();
    watsonAssistant =
        WatsonAssistantApiV2(watsonAssistantCredential: credential);
    _callWatsonAssistant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('환경부 장관실'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.restore,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Intro()),
              );
              //watsonAssistantContext.resetContext();
              setState(() {
                //_text = null;
              });
            },
          )
        ],
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                _text != null ? '$_text' : '',
                style: Theme.of(context).textTheme.display1,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: '메세지 보내기',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callWatsonAssistant,
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}