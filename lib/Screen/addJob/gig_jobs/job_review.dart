import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/main_page.dart';

class ReviewJob extends StatefulWidget {
  final String jobTitle;
  final String jobDiscription;
  final String selectedContainerText;
  final double jobPayment;
  ReviewJob({Key? key, required this.selectedContainerText, required this.jobTitle, required this.jobDiscription, required this.jobPayment})
      : super(key: key);


  @override
  State<ReviewJob> createState() => _ReviewJobState();
}

class _ReviewJobState extends State<ReviewJob> {
  int selectedPayment = 0;
  @override
  Widget build(BuildContext context) {
    double totalPayment = widget.jobPayment * 5;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Review and preview",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,

      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          SizedBox( height: 20),
          const Text("Please make sure all of this detail are correct:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
          ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2
                )
              ),
              alignment: Alignment.topLeft,
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Title of the job: ${widget.jobTitle}"
                    ),
                    Text("Description of the job: ${widget.jobDiscription} "),
                    Text("Job Payment per hour: RM${widget.jobPayment}"),
                    const Text("Job location: IIUM Gombak "),

                    Text("Job visibility: ${widget.selectedContainerText}"),
                    const Text("Date and duration: "),
                    Text("Total Payment: RM $totalPayment")
                  ],
                ),
            ),
          ), // content review
          const Text("Pay Through: ", style: TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 85,vertical: 20),
            child: Row(
              children: [
                paymentSelection(1, "eWallet"),
                const SizedBox(width: 20),
                paymentSelection(2,"Credit Card"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()));
                _submitButton(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: selectedPayment !=0 ?Theme.of(context).primaryColor :
                  Colors.grey,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: const Text("Make Payment and publish job",
                style: TextStyle(
                  fontSize: 16,
                    color: Colors.white
                ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_back),
                        SizedBox(width: 5),
                        Text("Back"),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pop(context);

                  },
                ),
                const SizedBox(width: 60),
                GestureDetector(
                    child: const Text(
                      "Cancel",
                    ),
                  onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage() ));

                  },
                ),
              ],
            ),
          ), // cancel Button
        ],
      ),
    );
  }



  Widget paymentSelection(int containerNumber, String text) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event to toggle the selection state
        setState(() {
          selectedPayment = containerNumber;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 80,
        decoration: BoxDecoration(
          color: selectedPayment == containerNumber
              ? Theme.of(context).primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 3,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedPayment == containerNumber
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
  void _submitButton (BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text("Your Job has been posted"),
            actions: [
              TextButton(onPressed: () {


                Navigator.pop(context);
              }, child: Text("Okay"))
            ],
          );

        });
  }
}
