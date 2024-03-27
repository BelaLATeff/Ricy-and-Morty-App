import 'package:flutter/material.dart';
import '../../../constants/my_color.dart';
import '../../../constants/string.dart';
import '../../../data/models/character_results.dart';

class CharacterItem extends StatelessWidget {
  final CharacterResults character;
  const CharacterItem({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.all(9),
      padding: const EdgeInsetsDirectional.all(5),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(7),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
            arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.id!,
            child: Container(
              width: double.infinity,
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                character.name!,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: character.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: "assets/images/Loading.gif",
                    image: character.image!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(""),
          ),
        ),
      ),
    );
  }
}
