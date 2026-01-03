import 'package:flutter/material.dart';
import 'home_screen.dart';

class Cleaning extends StatefulWidget {
  const Cleaning({super.key});

  @override
  State<Cleaning> createState() => _CleaningState();
}

class _CleaningState extends State<Cleaning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Home Button
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    icon: Icon(Icons.home),
                    iconSize: 24,
                    color: Colors.orange,
                  ),

                  // Title
                  Text(
                    "Cleaning",
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  // Search Circle Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(Icons.search, size: 20),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Subcategories or other content here
              Text(
                "Subcategories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SubCategriesCard( icon: Icons.phone_android, text: 'Mobile Friendly',color:Colors.pink),
                  _SubCategriesCard( icon: Icons.computer, text: 'Computer',color:Colors.red),
                  _SubCategriesCard( icon: Icons.tab, text: 'Tab',color:Colors.grey),
                  _SubCategriesCard( icon: Icons.tv, text: 'Tv',color:Colors.blueAccent),
                ]
              ),
              const SizedBox(height: 10,),

         //    //Grid images
         // GridView.count(crossAxisCount: 2,
         //   mainAxisSpacing: 16,
         //   crossAxisSpacing: 16,
         //   childAspectRatio: 0.7,
         //   children: [
         //     _CleannigServiceCard(icon:Icons.search),
         //     _CleannigServiceCard(icon:Icons.phone)
         //   ],
         // )


            ],
          ),
        ),
      ),
    );
  }
}


class  _SubCategriesCard extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color color;
  const _SubCategriesCard({required this.icon, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Icon(icon,size: 30,color: Colors.orange,),
        ),
        const SizedBox(height: 10,),
        Text(text,style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w600),)
      ],


    );

  }
}

// //grid view ko
// class _CleannigServiceCard extends StatelessWidget {
//   final  IconData icon;
//   const _CleannigServiceCard({ required this.icon});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16)
//
//       ),
//       elevation: 4,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//         Container(
//           color: Colors.green,
//         child:  Icon(icon,size: 24,),
//         )
//
//         ],
//       ),
//     );
//   }
// }
