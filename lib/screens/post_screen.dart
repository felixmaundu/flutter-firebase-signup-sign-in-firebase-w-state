import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String username = "";
  void initState() {
    super.initState();
    //getUserName();
  }

// void getUserName() async {
//  DocumentSnapshot snap  await FirebaseFirestore.instance.collection('users').doc(
//     FirebaseAuth
//     .instance
//     .currentUser!uid)
//     .get();

//     print(snap.data());

//     setState(() {
//       username = (snap.data() as Map<String, dynamic>)['username'];
//     });)
// }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('post screen'));
  }
}
