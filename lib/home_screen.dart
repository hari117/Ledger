import 'package:flutter/material.dart';
import 'package:ledgerpratice/accout_settings_page.dart';
import 'package:ledgerpratice/createUserAccoutPage.dart';
import 'package:ledgerpratice/credit_amount_screen.dart';
import 'package:ledgerpratice/debit_amount_screen.dart';
import 'package:ledgerpratice/getit_locater.dart';
import 'package:ledgerpratice/login_screen.dart';
import 'package:ledgerpratice/state_managemnt.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Debit",
                ),
                Tab(
                  text: "Credit",
                ),
                Tab(
                  text: "history",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [

              DebitAmountScreen(),
              CreditScreen(),
              Scaffold(
                body: Center(
                  child: Text("page 1"),
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // CircleAvatar(
                  //   maxRadius: 60,
                  //   backgroundImage:NetworkImage(google.currentUser.photoUrl),
                  // ),
                  Divider(),
                  Text(google.currentUser.displayName),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Acccout Settings"),
                    onTap: ()
                    {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AccoutsettingsPage()),
                      // );
                    },
                  ),
                  Divider(),
                  FlatButton(
                    child: Text("Logout"),
                   onPressed: ()
                    {
                      googleLogout();
                    },
                     ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  googleLogout()
  {
    google.signOut();
  }
}
