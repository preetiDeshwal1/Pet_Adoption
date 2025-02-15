import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/features/presentation/home/bloc/bloc.dart';
import 'package:petadoption/features/presentation/home/bloc/state.dart';

import '../../../../shared/widgets.dart';
import '../../../model/pet_model.dart';
import '../../details/ui/detalis_screen.dart';
import '../../history/ui/history.dart';
import '../../settings/ui/settings_screen.dart';
import '../bloc/event.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  late ScrollController scrollController;
  int page = 1;
  bool isLoading = false;
  String searchQuery = "";
  int minAge = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PetsBloc>(context).add(LoadPets());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsBloc, PetsState>(builder: (context, state) {
      return (state is PetsLoaded)
          ? Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigate to the Settings screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingsScreen()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundColor:
                                      Colors.blueAccent.withOpacity(0.2),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage("images/profile.png"),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, Preeti 👋",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    "Find your perfect pet!",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart,
                                size: 28, color: Colors.blueAccent),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PetHistoryScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<PetsBloc>()
                                  .add(SlectPetIndexEvent(index));
                              // selectedIndex = index;
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30, top: 10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    decoration: BoxDecoration(
                                      color: state.selectedIndex == index
                                          ? const Color(0xffFF9166)
                                          : const Color(0xffFF9166)
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: state.selectedIndex == index
                                              ? const Color(0xffFF9166)
                                                  .withOpacity(0.5)
                                              : Colors.transparent,
                                          blurRadius: 12,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        categoryList[index],
                                        style: TextStyle(
                                            color: state.selectedIndex == index
                                                ? Colors.white
                                                : Colors.amber[900],
                                            fontWeight:
                                                state.selectedIndex == index
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                            fontSize: 18),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Search by name...",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onChanged: (value) {
                                final query = searchController.text;
                                print("query $query");
                                // final minAge = int.tryParse(ageController.text) ?? 0;
                                context.read<PetsBloc>().add(SearchPets(query));
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller: ageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Age",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onSubmitted: (value) {
                                // final query = searchController.text;
                                final minAge =
                                    int.tryParse(ageController.text) ?? 0;
                                print("query $minAge");
                                context
                                    .read<PetsBloc>()
                                    .add(FilterPetsByAge(minAge));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    state.pets.isNotEmpty
                        ? (Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 1.4,
                              child: ListView.builder(
                                  itemCount: state.pets.length,
                                  // categories[state.selectedIndex].length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              pets: state.pets[
                                                  index], //categories[state.selectedIndex][index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 15),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .scaffoldBackgroundColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    height: 50,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 30),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: state
                                                            .pets //categories[state.selectedIndex]
                                                            [index]
                                                            .color,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      height: 130,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 130,
                                                    child: Center(
                                                      child: Hero(
                                                        tag: state
                                                            .pets //categories[state.selectedIndex]
                                                            [index]
                                                            .image,
                                                        child: Image.asset(
                                                          state
                                                              .pets //categories[state.selectedIndex]
                                                              [index]
                                                              .image,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: state
                                                        .pets //categories[state.selectedIndex]
                                                        [index]
                                                        .color
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  height: 100,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          state
                                                              .pets //categories[state.selectedIndex]
                                                              [index]
                                                              .name,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 25,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          state
                                                              .pets //categories[state.selectedIndex]
                                                              [index]
                                                              .breed,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Age: ${state.pets /*categories[state.selectedIndex]*/ [index].age} year old",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ))
                        : Container(
                            alignment: Alignment.center,
                            child: Text("No pets found in this filter"),
                          ),
                  ],
                ),
              )),
            )
          : GlobWidgets.progressBar();
    });
  }
}
