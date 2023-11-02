import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              // * Appbar
              MyAppBar(size: size),
              // * Main Body
              Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      // TODO: tab bar
                      Expanded(flex: 1, child: _buildTabBar()),
                      const SizedBox(
                        height: 25,
                      ),
                      Expanded(
                          flex: 13,
                          child: Container(
                            color: Colors.yellow,
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTabBar() {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return AnimatedContainer(
          margin: EdgeInsets.fromLTRB(index == 0 ? 15 : 5, 0, 5, 0),
          duration: const Duration(milliseconds: 300),
          width: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15)
          ),
          child: const Center(
            child: Text(
              'data',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      });
}

class MyAppBar extends StatelessWidget {
  final Size size;
  const MyAppBar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          width: size.width,
          height: size.height / 3.5,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/1.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'What would you like\n to find?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                width: double.infinity,
                height: 50,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      filled: true,
                      contentPadding: const EdgeInsets.only(top: 5),
                      fillColor: const Color.fromARGB(255, 228, 228, 228),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Color.fromARGB(255, 146, 146, 146),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 131, 131, 131))),
                ),
              )
            ],
          ),
        ));
  }
}
