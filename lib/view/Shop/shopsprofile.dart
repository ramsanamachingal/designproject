import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManyShopsProfile extends StatefulWidget {
  final String userId;
  const ManyShopsProfile({super.key, required this.userId});

  @override
  State<ManyShopsProfile> createState() => _ManyShopsProfileState();
}

class _ManyShopsProfileState extends State<ManyShopsProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.pink),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Divider(color: Colors.pink),
        ),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
                child:
                    Text("Error loading designer data")); // Show error message
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No designer data found"));
          }

          final dsgnrdata =
              snapshot.data as Map<String, dynamic>; // Extract designer data

          // Extract individual fields
          String designerName = dsgnrdata['name'] ?? 'Unknown';
          String phone = dsgnrdata['phone'] ?? 'N/A';
          String image = dsgnrdata['image'] ?? '';

          return Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: image.isEmpty
                      ? const AssetImage(
                          'assets/fd3204f6a96131bfc87294db5118dd36.jpg')
                      : NetworkImage(image) as ImageProvider,
                ),
                Text(
                  designerName,
                  style: GoogleFonts.pacifico(fontSize: 30, color: Colors.pink),
                ),
                Text(
                  phone,
                  style: GoogleFonts.pacifico(fontSize: 25, color: Colors.pink),
                ),
                Expanded(
  child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
    future: fetchDressData(),
    builder: (context, dsnapshot) {
      print(dsnapshot.data);
      print('#@@@@@@@@@@@@@@@################');

      if (dsnapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (dsnapshot.hasError) {
        return Center(child: Text('Error: ${dsnapshot.error}'));
      }
      if (!dsnapshot.hasData || dsnapshot.data!.docs.isEmpty) {
        return const Center(child: Text('No dresses available'));
      }

      var dressDocs = dsnapshot.data!.docs;

      return GridView.builder(
        itemCount: dressDocs.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          var dressData = dressDocs[index].data();
          String? imageUrl = dressData['image']; // Assuming your image URL field is 'imageUrl'

          return Container(
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.cover, // Ensures the image fills the container nicely
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Image is loaded
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.error)); // If there is an error loading the image
                    },
                  )
                : const Center(child: Text('No Image Available')), // Fallback if image URL is null
          );
        },
      );
    },
  ),
)

              ],
            ),
          );
        },
      ),
    );
    
  } 
  Future<QuerySnapshot<Map<String, dynamic>>> fetchDressData() {
    return FirebaseFirestore.instance
        .collection('ShopDress')
        .doc(widget.userId)
        .collection('shdress')
        .get();
      
  }

  Future<Map<String, dynamic>> fetchData() async {
    try {
      DocumentSnapshot designerSnapshot = await FirebaseFirestore.instance
          .collection('shop')
          .doc(widget.userId) // Using the userId to get the specific designer
          .get();
      if (designerSnapshot.exists) {
        return {
          "name": designerSnapshot['Shop name:'],
          "image": designerSnapshot['image'],
          "phone": designerSnapshot['phone number'],
        };
      } else {
        return {}; // Return an empty map if no designer is found
      }
    } catch (e) {
      print("Error fetching designer data: $e");
      return {}; // Return empty map in case of error
    }
  }
   
  }
