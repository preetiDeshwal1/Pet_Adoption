import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/features/presentation/details/bloc/state.dart';
import '../../../../shared/widgets.dart';
import '../../../model/history_model.dart';
import '../../../model/pet_model.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';

class DetailScreen extends StatefulWidget {
  final PetsModel pets;
  const DetailScreen({super.key, required this.pets});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<PetsDetalisBloc>().add(IsPetAdopted(widget.pets.name));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<PetsDetalisBloc, PetsDetailState>(
        builder: (context, state) {
      return (state is PetsisAdoptedLoading)
          ? Scaffold(
              body: Stack(
                children: [
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: size.height,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.73),
                          Text(
                            widget.pets.name,
                            style: const TextStyle(
                              fontSize: 50,
                            ),
                          ),
                          Text(
                            widget.pets.description,
                            style: const TextStyle(
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: size.height * 0.7,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: widget.pets.color,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Center(
                              child: Hero(
                                tag: widget.pets.image,
                                child: InteractiveViewer(
                                  boundaryMargin: EdgeInsets.all(20),
                                  minScale: 1.0,
                                  maxScale: 5.0,
                                  child: Image.asset(
                                    widget.pets.image,
                                    height: size.height * 0.4,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ageOrigin(widget.pets.age, "Age"),
                                  ageOrigin(widget.pets.origin, "Origin"),
                                  ageOrigin(widget.pets.price, "Price"),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                if ((state.adopted)) {
                                  return;
                                }
                                context.read<PetsDetalisBloc>().add(
                                    AdoptedEvent(PetsHistoryModel(
                                        image: widget.pets.image,
                                        name: widget.pets.name,
                                        breed: widget.pets.breed,
                                        age: widget.pets.age,
                                        origin: widget.pets.origin,
                                        price: widget.pets.price,
                                        color: widget.pets.color,
                                        description: widget.pets.description,
                                        dateTime: DateTime.now())));
                                _showAdoptionPopup(widget.pets.name, context);
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (state.adopted == false)
                                        ? Colors.green
                                        : Colors.grey),
                                child: Text(
                                  (state.adopted == false)
                                      ? "Adopt Me"
                                      : "Already Adopted",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : GlobWidgets.progressBar();
    });
  }

  void _showAdoptionPopup(String petName, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("Congratulations! 🎉"),
          content: Text("You’ve adopted $petName"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close popup
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Container ageOrigin(value, name) {
    return Container(
      height: 85,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$value",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black45,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black26,
            ),
          )
        ],
      ),
    );
  }
}
