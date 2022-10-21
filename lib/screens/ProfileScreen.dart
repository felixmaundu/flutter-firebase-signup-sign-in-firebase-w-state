import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project10/models/user.dart' as model;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //model.User user = Provider.of<UserProvider>(context).getUser;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('!user.username'),
      ),
    );
  }
}
