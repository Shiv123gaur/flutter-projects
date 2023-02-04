import 'package:chatt/Welcome_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat_Screen extends StatefulWidget {
  static String id = 'chat';

  @override
  State<Chat_Screen> createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  final _fireStore = FirebaseFirestore.instance;
  final messageTextcontroller  = TextEditingController();
  bool spinnerON = false;
  late String TEXTchat;
  final _authh = FirebaseAuth.instance;
  late User? loggedinUser;
  getting_currentUser() async {
    final user = await _authh.currentUser;
    if(user!=null) {
      loggedinUser =user;
    }
  }

  @override
  void initState() {
    super.initState();
    getting_currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: ModalProgressHUD(
            inAsyncCall: spinnerON,
            child: Row(
              children: [
                MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
                SizedBox(
                  width: 25,
                ),
                Text("Chat Screen 🤫"),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                  splashColor: Colors.red,
                  onPressed: () async {
                    setState(() {
                      spinnerON = true;
                    });
                     _authh.signOut();
                     Navigator.pushNamed(context, Welcome_Screen.id);
                     setState(() {
                       spinnerON = false;
                     });
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            StreamBuilder<QuerySnapshot>(stream:FirebaseFirestore.instance.collection("messages").snapshots(),
                builder:(context,snapshot){
                  if(snapshot.hasData){
                    final  messages = (snapshot.data as dynamic).docs;
                    final currenUser = loggedinUser?.email;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context,index){
                          return MessageBubble(messages[index]["message"],messages[index]["sender"],currenUser == messages[index]["sender"]);
                        },

                      ),
                    );
                  }else{
                    return CircularProgressIndicator();
                  }
                }),
            Row(children: [
              Expanded(flex: 4,
                child: TextField(
                  controller: messageTextcontroller,
                  onChanged: (value) {
                    TEXTchat = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your message here",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Container(
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () {
                        messageTextcontroller.clear();
                        _fireStore.collection('messages').add({"message": TEXTchat,"sender":loggedinUser?.email});

                      },
                      child: Text("send", style: TextStyle(fontSize: 20)),
                    )),
              )
            ]),


          ],
        )),
      ),
    );
  }
}


class MessageBubble extends StatelessWidget {
  late String message;
  late String sender;
  final bool isMe;

  MessageBubble(this.message,this.sender,this.isMe);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: [
      Text(sender,style: TextStyle(color: Colors.black45),),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(elevation: 20,
            color: isMe?Colors.blue:Colors.white,
            borderRadius: isMe?BorderRadius.only(bottomLeft:Radius.circular(30) ,bottomRight:Radius.circular(30) ,topLeft:Radius.circular(30) ):BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message,style: TextStyle(fontSize:20,color:isMe?Colors.white:Colors.black45),),
            )),
      ),

    ],);
  }
}

