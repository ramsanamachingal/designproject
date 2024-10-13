import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Service/payment.dart';
import 'package:upi_india/upi_exception.dart';
import 'package:upi_india/upi_response.dart';

final recieverUPIID = "stylish@paytm";
class ShopPayment extends StatefulWidget {
  final String userId;
  final String dressId;
  const ShopPayment({super.key, required this.userId, required this.dressId , });

  @override
  State<ShopPayment> createState() => _ShopPaymentState();
}

class _ShopPaymentState extends State<ShopPayment> {
  final currentuid = FirebaseAuth.instance.currentUser!.uid;
  Future<UpiResponse>? transaction;
  String dressPrice = ""; // Variable to hold the dress price

 Future fetchData() async {
  Map<String, dynamic> designerName = {};
  QuerySnapshot dsgnrname = await FirebaseFirestore.instance.collection('Designer').get();

  for (var doc in dsgnrname.docs) {
    if (doc.id == widget.userId) {
      designerName = {'designername': doc['Designer name:']};
    }
    print(designerName);
  }

// Ensure you're querying by the correct document ID
print("Fetching document with ID: ${widget.dressId}");

QuerySnapshot snapshotp = await FirebaseFirestore.instance
    .collection('DesignerDress')
    .doc(widget.userId)
    .collection('dress')
    .where(FieldPath.documentId, isEqualTo: widget.dressId)
    .get();

if (snapshotp.docs.isEmpty) {
  print("No dress found with ID: ${widget.dressId}");
} else {
  print("Dress document found");
}


  for (var docs in snapshotp.docs) {
    // Log the entire document to see its structure
    print("Document Data: ${docs.data()}");

    Map<String, dynamic> data = {
      "name": docs['Dress name'],
      "image": docs['image'],
      "price": docs['price'],  // Check if 'price' is in the document
      "id": docs.id,
      "size": docs['size'],
    };

    // Check if price exists and is a valid string
    if (docs['price'] != null && docs['price'] is String) {
      dressPrice = docs['price'];
      print("Fetched Dress Price: $dressPrice");
    } else {
      dressPrice = "0";  // Handle cases where price is null or invalid
      print("Price not found, defaulting to 0");
    }

    Map<String, dynamic> mergedData = {};
    mergedData.addAll(designerName);
    mergedData.addAll(data);

    return mergedData;
  }
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: CupertinoColors.black,
    ),
    body: FutureBuilder(
      future: fetchData(),  // Fetch the dress data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error fetching data'));
        }
        if (!snapshot.hasData) {
          return const Center(child: Text('No data found'));
        }

        // Now the data is fetched successfully
        return Column(children: [
          Container(
            color: CupertinoColors.black,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Payment',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Make payment',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FutureBuilder(
            future: PaymentController().initializeUpiIndia(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        if (dressPrice.isEmpty) {
                          print("Dress price is empty");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Price is missing. Please try again."),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        double amount = 0.0;
                        try {
                          amount = double.parse(dressPrice);
                          print("Parsed Amount: $amount");

                          if (amount <= 0) {
                            throw FormatException("Price cannot be zero or negative");
                          }
                        } catch (e) {
                          print("Invalid price format: $e");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Invalid price format. Please try again."),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        PaymentController().initiateTransaction(
                          context,
                          app: snapshot.data![index],
                          receiverUpiId: recieverUPIID,
                          receiverName: "hophub",
                          amount: amount,
                        );
                      },
                      leading: Image.memory(snapshot.data![index].icon),
                      title: Text(
                        snapshot.data![index].name,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          FutureBuilder(
            future: transaction,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(
                    _upiErrorHandler(snapshot.error.runtimeType),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                UpiResponse upiResponse = snapshot.data!;

                String txnId = upiResponse.transactionId ?? 'N/A';
                String resCode = upiResponse.responseCode ?? 'N/A';
                String txnRef = upiResponse.transactionRefId ?? 'N/A';
                String status = upiResponse.status ?? 'N/A';
                String approvalRef = upiResponse.approvalRefNo ?? 'N/A';
                _checkTxnStatus(status);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      displayTransactionData('Transaction Id', txnId),
                      displayTransactionData('Response Code', resCode),
                      displayTransactionData('Reference Id', txnRef),
                      displayTransactionData('Status', status.toUpperCase()),
                      displayTransactionData('Approval No', approvalRef),
                    ],
                  ),
                );
              }

              return const Text(
                "",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ]);
      },
    ),
  );
}


  // Other methods (like displayTransactionData, _checkTxnStatus, etc.) remain unchanged
}



   Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              )),
          Flexible(
              child: Text(
            body,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    );
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

