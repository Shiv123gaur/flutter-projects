import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uId;
  final String Email;
  final String url;
  final List followers;
  final List following;
  User(
      {required this.username,
      required this.uId,
      required this.Email,
      required this.url,
      required this.followers,
      required this.following});
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uId,
        'Email': Email,
        'url': url,
        'followers': followers,
        'following': following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data()as Map<String, dynamic>;
    return User(
        username: snapshot['username'],
        uId: snapshot['uid'],
        Email: snapshot['Email'],
        url: snapshot['url'],
        followers: [],
        following: []
    );
  }
}
