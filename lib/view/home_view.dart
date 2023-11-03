import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_unsplash_api_getx/components/components.dart';
import 'package:flutter_unsplash_api_getx/controller/simple_ui_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

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
                          child: Obx(
                            () => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: GridView.custom(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate: SliverQuiltedGridDelegate(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      pattern: [
                                        const QuiltedGridTile(2, 2),
                                        const QuiltedGridTile(1, 1),
                                        const QuiltedGridTile(1, 1),
                                        const QuiltedGridTile(1, 2),
                                      ]),
                                  childrenDelegate: SliverChildBuilderDelegate(
                                      childCount: simpleUIController
                                          .photos.length, (context, index) {
                                    return Container(
                                      // color: Colors.red,
                                      child: CachedNetworkImage(
                                        imageUrl: simpleUIController
                                            .photos[index].urls!['small'],
                                        imageBuilder: (context, img) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: img,
                                                  fit: BoxFit.cover),
                                            ),
                                          );
                                        },
                                        placeholder: (context, url) => Center(child: customLoading(),),
                                        errorWidget: (context, url, error) => Center(child: errorIcon(),),
                                      ),
                                    );
                                  })),
                            ),
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return ListView.builder(
      itemCount: simpleUIController.orders.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Obx(
          () => GestureDetector(
            onTap: () {
              simpleUIController.selectedIndex.value = index;
            },
            child: AnimatedContainer(
              margin: EdgeInsets.fromLTRB(index == 0 ? 15 : 5, 0, 5, 0),
              duration: const Duration(milliseconds: 300),
              width: 100,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  color: index == simpleUIController.selectedIndex.value
                      ? Colors.grey[700]
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                    index == simpleUIController.selectedIndex.value ? 18 : 15,
                  )),
              child: Center(
                child: Text(
                  simpleUIController.orders[index],
                  style: TextStyle(
                    // color: Colors.black,
                    color: index == simpleUIController.selectedIndex.value
                        ? Colors.white
                        : Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
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
