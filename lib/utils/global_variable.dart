import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project10/screens/ProfileScreen.dart';
import 'package:project10/screens/addPost_screen.dart';
import 'package:project10/screens/feed_screen.dart';
import 'package:project10/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('notifications'),
  ProfileScreen(
      //uid: FirebaseAuth.instance.currentUser!.uid,
      ),
];
