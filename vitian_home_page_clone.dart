import 'package:flutter/material.dart';

const primary_color = Color.fromRGBO(42, 72, 110, 1);
const purple_color = Color.fromRGBO(197, 173, 247, 1);

const TextStyle text_style1 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TextStyle text_style2 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

class index extends StatelessWidget {
  const index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),

      appBar: AppBar(
        toolbarHeight: 160,
        backgroundColor: primary_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
        ),
        foregroundColor: Colors.white,

        flexibleSpace: Container(
          height: 150,
          decoration: BoxDecoration(color: Colors.transparent),
          margin: EdgeInsets.only(left: 35, right: 10, top: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: ClipOval(
                      child: Image.asset("images/man.png", fit: BoxFit.cover),
                    ),
                  ),

                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.power_settings_new,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10),
              Text(
                "DHINESH KUMAR P",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),

              Text(
                "23BCS0022",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {},
        backgroundColor: primary_color,
        foregroundColor: Colors.white,
        child: Icon(Icons.menu_open, size: 40),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: Stack(
        children: [
          Container(color: primary_color),

          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            ),

            padding: EdgeInsets.only(left: 15, top: 40, right: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Timetable - Current Day", style: text_style1),
                      Row(
                        children: [
                          Text("More", style: text_style2),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward_ios_rounded, size: 14),
                        ],
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width - 40,
                        height: 60,
                        child: Center(
                          child: Text(
                            "No data found!",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Biometric Log", style: text_style1),
                      Row(
                        children: [
                          Text("More", style: text_style2),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward_ios_rounded, size: 14),
                        ],
                      ),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          width: 180,
                          height: 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Time : 11-04-2025 11:24:30",
                                style: text_style1.copyWith(fontSize: 16),
                              ),
                              Text(
                                "Room: SJTG103",
                                style: text_style2.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          width: 180,
                          height: 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Time : 11-04-2025 11:24:30",
                                style: text_style1.copyWith(fontSize: 16),
                              ),
                              Text(
                                "Room: SJTG103",
                                style: text_style2.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          height: 90,
          shape: CircularNotchedRectangle(),
          color: primary_color,
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,

            backgroundColor: Colors.transparent,
            selectedIconTheme: IconThemeData(color: purple_color, opacity: 1),
            unselectedIconTheme: IconThemeData(color: Colors.white, opacity: 1),
            selectedItemColor: purple_color,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(fontSize: 10),
            unselectedLabelStyle: TextStyle(fontSize: 10),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 30),
                label: "Home",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined, size: 30),
                label: "Attendance",
              ),

              BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),

              BottomNavigationBarItem(
                icon: Icon(Icons.campaign_outlined, size: 30),
                label: "Spotlight",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view, size: 30),
                label: "More",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
