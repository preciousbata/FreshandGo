import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:restaurant_app/injection.dart';
import 'package:restaurant_app/src/core/contants.dart';
import 'package:restaurant_app/src/data/repository/fruit_juice_repository_impl.dart';
import 'package:restaurant_app/src/domain/entity/fruit_juice_entity.dart';
import 'package:restaurant_app/src/presentation/screen/shopping_cart_screen.dart';
import 'package:restaurant_app/src/presentation/widgets/fruit_juice_card.dart';
import 'package:restaurant_app/src/presentation/widgets/shopping_cart_button.dart';
import 'package:restaurant_app/src/presentation/widgets/show_modal_popup.dart';
import 'package:restaurant_app/src/presentation/widgets/sidemenu.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final fruitJuiceRepository = sl.get<FruitJuiceRepoImpl>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: height * 0.05,
        backgroundColor: LIGHT_GREEN_COLOR,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      drawer: SideMenu(
        width: width,
        height: height,
      ),
      body: StreamBuilder<List<FruitJuiceEntity>>(
        stream: fruitJuiceRepository.fruitJuice,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            fruitJuice = snapshot.data!;
            return fruitJuice.isEmpty
                ? const Center(
                    child: Text('List is empty'),
                  )
                : ListView(
                    children: [
                      SizedBox(
                        height: height * 1.85,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: MasonryGridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: fruitJuice.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(width * 0.008),
                                child: InkWell(
                                  onTap: () => orderScreen(
                                      context, width, height, index),
                                  child: FruitJuiceCard(
                                    width: width,
                                    amount: fruitJuice[index].amount,
                                    juiceName: fruitJuice[index]
                                        .juiceName
                                        .toUpperCase(),
                                    imageUrl: fruitJuice[index].imageUrl,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
          } else {
            Center(
              child: CircularProgressIndicator(
                color: PRIMARY_COLOR,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: ShopppingCartBuuton(
        width: width,
        onPressed: () =>
            Navigator.pushNamed(context, ShoppingCartScreen.routeName),
      ),
    );
  }

  Future<dynamic> orderScreen(
      BuildContext context, double width, double height, int index) {
    return showModalBottomSheet(
        context: context,
        elevation: 0,
        builder: (context) {
          return ShowModalPopUp(
              width: width * 0.23,
              height: height * 0.12,
              imageUrl: fruitJuice[index].imageUrl,
              amount: fruitJuice[index].amount,
              juiceName: fruitJuice[index].juiceName);
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ));
  }
}
