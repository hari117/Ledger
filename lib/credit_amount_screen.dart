import 'package:flutter/material.dart';

class CreditScreen extends StatefulWidget {
  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {

  TextEditingController bankNameTE = TextEditingController();
  TextEditingController accountNumberTE = TextEditingController();
  TextEditingController IfscCodeTE = TextEditingController();
  TextEditingController AmountTE = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Receive From Other Accounts",
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text("Enter Bank Name :")),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(hintText: "Enter Bank Name"),
                      ),
                    )
                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text("Account Number :")),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(hintText: "Enter Accout Number"),
                      ),
                    )
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text("IFSC code:")),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(hintText: "Enter IFSC Code"),
                      ),
                    )
                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text("Amount:")),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(hintText: "Enter Amount To Send"),
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Expanded(flex: 1, child:Container()),
                    Expanded(
                      flex: 2,
                      child: FlatButton(
                        color: Colors.blue,
                        child:Text("Send",style: TextStyle(color: Colors.white),),
                        onPressed: ()
                        {
                          // code here
                          print("send button is pressed");
                        },
                      ),

                    ),
                    Expanded(flex: 1, child: Container()),

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
