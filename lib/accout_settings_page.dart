import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ledgerpratice/getit_locater.dart';
import 'package:ledgerpratice/login_screen.dart';
import 'package:ledgerpratice/state_managemnt.dart';

class AccoutsettingsPage extends StatefulWidget {
  @override
  _AccoutsettingsPageState createState() => _AccoutsettingsPageState();
}

class _AccoutsettingsPageState extends State<AccoutsettingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getDocDetails();
  }

  getDocDetails() async {
    DocumentSnapshot docd =
        await collectionReference.document(google.currentUser.id).get();
    //   print(docd.data());
    locater<LedgerGlobalState>().getUserDetails(docd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Your Bank Accout Details",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Name",
                  style: TextStyle(fontSize: 14),
                ),
              ),

              Text(
                locater<LedgerGlobalState>().userAccountModel.name,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Bank Name",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Text(
                locater<LedgerGlobalState>().userAccountModel.bankName,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Accout Number",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Text(
                locater<LedgerGlobalState>().userAccountModel.bankAccount,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "IFSC Code",
                  style: TextStyle(fontSize: 14),
                ),
              ),

              //
              Text(
                locater<LedgerGlobalState>().userAccountModel.ifscCode,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Accout Balance",
                  style: TextStyle(fontSize: 14),
                ),
              ),

              Text(
                "${locater<LedgerGlobalState>().userAccountModel.accountBalance}",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              SizedBox(
                height: 40,
              ),

              FlatButton(
                color: Colors.white,
                onPressed: () {
               //   addBankBalance(100);
                },
                child: Text("add Money"),
              )
            ],
          ),
        ),
      ),
    );
  }

  addBankBalance(double currency)async {
  //  locater<LedgerGlobalState>().userAccountModel.money=0;
    print("add balance method called");
    double totalCurrency =locater<LedgerGlobalState>().userAccountModel.accountBalance+currency;
    setState(() {
      locater<LedgerGlobalState>().userAccountModel.accountBalance=totalCurrency;


    });
    Map<String, double> map1 = {"accountBalance": totalCurrency};
    await collectionReference.doc(google.currentUser.id)
        .updateData(map1);
  }
}
