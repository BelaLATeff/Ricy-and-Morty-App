import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../constants/my_color.dart';
import '../../cubit/character_cubit.dart';
import '../../data/models/character_results.dart';
import 'widget/character_search.dart';
import 'widget/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<CharacterResults>? results;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).sendAllCharacters();
  }

  Widget buildBlocBuilder() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          results = (state).characters.results;
          return SingleChildScrollView(
            child: Container(
              color: MyColors.myGrey,
              child: buildCharacterList(),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColors.myYellow,
            ),
          );
        }
      },
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: results!.length,
        itemBuilder: (context, index) {
          return CharacterItem(
            character: results![index],
          );
        });
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Can't Connect...Please Check Internet",
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset("assets/images/no_internet.gif"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Characters",
              style: TextStyle(color: MyColors.myGrey),
            ),
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CharacterSearch(
                      characterSearch: results!,
                    ),
                  );
                },
                icon: const Icon(Icons.search))
          ],
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocBuilder();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
