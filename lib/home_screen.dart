import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<Map<String, String>> items = [
    {"label": "Student", "image": "Images/student.png"},
    {"label": "Teacher", "image": "Images/teacher.png"},
    {"label": "Attendance", "image": "Images/attendance.png"},
    {"label": "Syllabus", "image": "Images/syllabus.png"},
    {"label": "Timetable", "image": "Images/timetable.png"},
    {"label": "Assignment", "image": "Images/assignment.png"},
    {"label": "Exam", "image": "Images/exam.png"},
    {"label": "Results", "image": "Images/results.png"},
    {"label": "Fee", "image": "Images/fee.png"},
    {"label": "Events", "image": "Images/events.png"},
    {"label": "Inbox", "image": "Images/inbox.png"},
    {"label": "Ask Doubt", "image": "Images/askdoubt.png"},
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered list based on the search query
    final filteredItems = items
        .where((item) =>
            item["label"]!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: TextStyle(color: Colors.black45, fontSize: 26),
            ),
            Text(
              'Michael Smith',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search categories...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value; // Update search query
                });
              },
            ),
            const SizedBox(height: 20.0),

            // Categories
            const Text(
              "Academics",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            // Grid of Items
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: filteredItems.length, // Filtered items count
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item["image"]!,
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        item["label"]!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}
