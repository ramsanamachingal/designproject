import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Service/payment.dart';
// import 'package:login/view/Shop/ShopHome.dart';
import 'package:login/view/function.dart/shop_bottom.dart';
import 'package:upi_india/upi_exception.dart';
import 'package:upi_india/upi_response.dart';

final recieverUPIID = "stylish@paytm";

class ShopPayment extends StatefulWidget {
  final String userId;
  final String dressId;
  final String check;
  final String dressSize;
  const ShopPayment( {
    super.key, required this.userId, required this.dressId, required this.check, required this.dressSize,
    // required this.userId,
    // required this.dressId, required this.check, required this.dressSize,
  });

  @override
  State<ShopPayment> createState() => _ShopPaymentState();
}

class _ShopPaymentState extends State<ShopPayment> {
  final currentuid = FirebaseAuth.instance.currentUser!.uid;
  Future<UpiResponse>? transaction;
  String dressPrice = ""; // Variable to hold the dress price
  String designerName = ""; // Variable to hold the designer's name
  String dressImage="";
  // String shopprice="";
PaymentController paytm=PaymentController();


  Future fetchData() async {
    
    if(widget.check =="designer"){
Map<String, dynamic> designerData = {};
    QuerySnapshot dsgnrname = await FirebaseFirestore.instance.collection('Designer').get();

    for (var doc in dsgnrname.docs) {
      if (doc.id == widget.userId) {
        designerName = doc['Designer name:'];
      // Store the designer's name
        designerData = {'designername': designerName};
      }
      print(designerData);
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
        dressImage = docs['image'];
        print("Fetched Dress Price: $dressPrice");
      } else {
        dressPrice = "0";  // Handle cases where price is null or invalid
        print("Price not found, defaulting to 0");
      }

      Map<String, dynamic> mergedData = {};
      mergedData.addAll(designerData);
      mergedData.addAll(data);

      return mergedData;
    }
    }
    else if(widget.check=="shop"){
      Map<String, dynamic> shopData = {};
    QuerySnapshot shopname = await FirebaseFirestore.instance.collection('shop').get();

    for (var doc in shopname.docs) {
      if (doc.id == widget.userId) {
        designerName = doc['Shop name:']; // Store the designer's name
        shopData = {'shopname': designerName};
      }
      print(shopData);
    }

    // Ensure you're querying by the correct document ID
    print("Fetching document with ID: ${widget.dressId}");

    QuerySnapshot snapshotp = await FirebaseFirestore.instance
        .collection('ShopDress')
        .doc(widget.userId)
        .collection('shdress')
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
         dressImage = docs['image'];
        print("Fetched Dress Price: $dressPrice");
       
      } else {
        dressPrice = "0";  // Handle cases where price is null or invalid
        print("Price not found, defaulting to 0");
      }

      Map<String, dynamic> mergedData = {};
      mergedData.addAll(shopData);
      mergedData.addAll(data);

      return mergedData;
    }
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
      future: fetchData(),  // Keep fetching the dress data
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

        // Now the dress data is fetched successfully
        return Column(
          children: [
            Container(
              color: CupertinoColors.black,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
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
            const SizedBox(height: 30),

            // Existing FutureBuilder for UPI apps
            FutureBuilder(
              future: PaymentController().initializeUpiIndia(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
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

  // Start the UPI transaction
  PaymentController().initiateTransaction(
    context,
    app: snapshot.data![index],
    receiverUpiId: recieverUPIID,
    receiverName: designerName,  // Use the fetched designer's name
    amount: amount,
  );

  // Record payment sample with automatically generated ID
  await paytm.paymentSample(dressPrice, "true", designerName, currentuid,widget.dressSize,dressImage);
   print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
        // print(dressSize);
        print('pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp');

  // Display success dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Your transaction completed successfully"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopBottom(indexnum: 0)));
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
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

            // New FutureBuilder for latest payment
            FutureBuilder<Map<String, dynamic>?>(
              future: fetchLatestPayment(currentuid, widget.dressId), // Fetch the latest payment
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Error fetching payment data',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(
                    child: Text(
                      'No recent payment found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                // Payment data found, displaying it
                Map<String, dynamic> paymentData = snapshot.data!;
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Payment ID: ${paymentData['id']}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Paid To: ${paymentData['paid to']}",
                              style: const TextStyle(color: Colors.white)),
                          Text("Price: ${paymentData['price']}",
                              style: const TextStyle(color: Colors.white)),
                          Text("Payment Status: ${paymentData['paymentStatus']}",
                              style: const TextStyle(color: Colors.white)),
                          Text(
                            "Timestamp: ${paymentData['timestamp'] != null ? paymentData['timestamp'].toDate().toString() : 'N/A'}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        );
      },
    ),
  );
}

}
Future<Map<String, dynamic>?> fetchLatestPayment(String userId, String dressId) async {
  // Fetch the latest payment based on both userId and dressId
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('payment')
      .where('id', isEqualTo: userId)  // Filter by userId (current user)
      .where('dressId', isEqualTo: dressId)  // Also filter by dressId
      .orderBy('timestamp', descending: true)  // Order by timestamp to get the latest payment
      .limit(1)  // Limit to the latest payment
      .get();

  // Check if any payment document exists
  if (snapshot.docs.isNotEmpty) {
    return snapshot.docs.first.data() as Map<String, dynamic>;  // Return the first document's data
  }
  return null;
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
