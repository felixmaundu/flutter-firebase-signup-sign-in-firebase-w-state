import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project10/screens/SettingPage.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              pinned: false,
              centerTitle: true,
              elevation: 0,
              backgroundColor:
                  Theme.of(context).backgroundColor == Brightness.light
                      ? Colors.transparent
                      : Colors.black38,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => NotificationScreen(),
                    //   ),
                    // );
                  },
                  icon: Icon(Icons.notifications_active_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.near_me_sharp,
                  ),
                ),
              ],
              title: Text(
                "TabBar",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  // color: Colors.grey,
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    //height: 30,
                    child: Text(
                      'All',
                      style: Theme.of(context).brightness == Brightness.light
                          ? GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15,
                            )
                          : GoogleFonts.roboto(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Bookings & Travels',
                      style: Theme.of(context).brightness == Brightness.light
                          ? GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15,
                            )
                          : GoogleFonts.roboto(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Expanded(
                child: TabBarView(
                  children: [
                    Text("all content"),
                    Text("Booking And Travels Screen"),
                    // AllContent(),
                    // BookingAndTravelsScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
