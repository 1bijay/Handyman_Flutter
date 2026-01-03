import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final Color primaryOrange = const Color(0xFFFF6B4A);
  final Color bgColor = const Color(0xFFF9F9F9);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildSectionHeader('Categories', () {}),
              const SizedBox(height: 20),
              _buildCategoriesList(),
              const SizedBox(height: 20),
              _buildSpecialOfferBanner(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryOrange,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'calendar'),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view),label: 'grid'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'person')
      ]),
    );
  }
}

Widget _buildHeader() {
  Color? primaryOrange;
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.location_on, color: Colors.orange, size: 24),
      ),
      const SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Service In",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          Text(
            "New York",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const Spacer(),
      IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart, size: 26)),
      const SizedBox(width: 1),
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined, size: 28),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 10,
              height: 10,

              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text("1", style: TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildSearchBar() {
  return Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Find The Service you want...",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
      ),
      const SizedBox(width: 12),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.tune, color: Colors.white),
      ),
    ],
  );
}

Widget _buildSectionHeader(String title, VoidCallback onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      GestureDetector(
        onTap: onTap,
        child: Text(
          "See All",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}

// Widget _buildCategoriesList(){
//   final categories=[
//     {'name':'cleaning','icon':Icons.cleaning_services_outlined,
//       'color':const Color(0xFFFFF3F0)
//     },
//     {'name':'plumbing','icon':Icons.plumbing,'color':Color(0xFFEFF3FF)},
//     {'name':'Repairing','icon': Icons.build_outlined, 'color': const Color(0xFFFFF8E5)},
//     {'name':'laundry','icon': Icons.local_laundry_service_outlined, 'color': const Color(0xFFEFFFF4)}
//   ];
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       categories.map(()cat
//           return Column()
//       )
//     ],
//   );
// }
Widget _buildCategoriesList() {
  final categories = [
    {
      'name': 'Cleaning',
      'icon': Icons.cleaning_services_outlined,
      'color': const Color(0xFFFFF3F0),
    },
    {
      'name': 'Plumbing',
      'icon': Icons.plumbing,
      'color': const Color(0xFFEFF3FF),
    },
    {
      'name': 'Repairing',
      'icon': Icons.build_outlined,
      'color': const Color(0xFFFFF8E5),
    },
    {
      'name': 'Laundry',
      'icon': Icons.local_laundry_service_outlined,
      'color': const Color(0xFFEFFFF4),
    },
  ];
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: categories.map((cat) {
      return Column(
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: cat['color'] as Color,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              cat['icon'] as IconData,
              color: Colors.black87,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cat['name'] as String,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      );
    }).toList(),
  );
}
// 5. Special Offer Banner

Widget _buildSpecialOfferBanner() {
  return Container(
    width: double.infinity,
    height: 170,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "New",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "25% Off",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Friday Special!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
        // Banner Image (Right Side) - must be inside the Stack
        Positioned(
          right: -10,
          bottom: -20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://img.freepik.com/free-photo/smiling-young-cleaning-professional-wearing-uniform-holding-sponge-showing-thumb-up-isolated-orange-wall_141793-139366.jpg?auto=format&fit=crop&w=600",
              height: 160,
              width: 120,
              fit: BoxFit.cover,
              errorBuilder: (ctx, _, __) =>
                  Container(color: Colors.white24, width: 120, height: 160),
            ),
          ),
        ),
      ],
    ),
  );
}
