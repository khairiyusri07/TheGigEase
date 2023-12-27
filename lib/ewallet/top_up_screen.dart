import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wallet_firestore_service.dart';
import '../model/wallet_provider.dart';
import 'wallet__main_screen.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  int selectedAmount = 0;

  TextEditingController customAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    final firestoreService = FirestoreService(); // Instantiate FirestoreService

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Text(
                  "One-Time Top Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              //this is the box
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTopUpButton("5"),
                      SizedBox(width: 10),
                      buildTopUpButton("10"),
                      SizedBox(width: 10),
                      buildTopUpButton("20"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTopUpButton("50"),
                      SizedBox(width: 10),
                      buildTopUpButton("100"),
                      SizedBox(width: 10),
                      buildTopUpButton("200"),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              //enter the amount
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        "RM",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "${selectedAmount.toString()}",

                        ),
                        controller: customAmountController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            selectedAmount = int.tryParse(value) ?? 0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //receipt
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10,),
                      Text("Top Up Amount: RM$selectedAmount", style: TextStyle(fontWeight: FontWeight.normal),),
                      Text("Total Payment: RM${selectedAmount.toString()}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              //submit button


            ],
          ),

          Center(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                    )
                  ),
                  onPressed: () async {
                    double topUpAmount = selectedAmount.toDouble();

                    // If custom amount is entered, use that instead
                    if (customAmountController.text.isNotEmpty) {
                      topUpAmount = double.tryParse(customAmountController.text) ?? 0.0;
                    }
                    // Update the balance in Firestore
                    await firestoreService.topUpBalance(topUpAmount);

                     walletProvider.addMoney(topUpAmount.toDouble());
                    Navigator.pop(context);
                    _topUpSuccessAllert(context);
                  },
                  child: Text('Top Up', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopUpButton(String amount) {
    bool isSelected = selectedAmount == int.parse(amount);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = int.parse(amount);
          customAmountController.clear();
        });
      },
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
              width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          amount,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: isSelected ? Theme.of(context).primaryColor
                : Colors.grey,),
        ),
      ),
    );
  }


  void _topUpSuccessAllert (BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text("Top Up"),
        content: Container(
          height: 80,
          child: Column(
            children: [
              Text(
                  "You have successfully add RM ${selectedAmount.toString()} to your account's eWallet",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                  ),
              ),

            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WalletScreen()));
            },
            child: Text("Close"),
          ),
        ],


      );
    });

}
}
