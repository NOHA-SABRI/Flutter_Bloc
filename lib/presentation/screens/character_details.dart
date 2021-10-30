import 'dart:math';

import 'package:breaking_bad_flutter_bloc/businesslogic/characters_cubit.dart';
import 'package:breaking_bad_flutter_bloc/constants/colors.dart';
import 'package:breaking_bad_flutter_bloc/data/models/characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  CharacterDetailsScreen({required this.character});

  Widget _buildSilverAppBar() {
    return SliverAppBar(
      backgroundColor: MyColors.myGray,
      expandedHeight: 600,
      // pinned: true,
      // stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _characterInfo(String title, String value) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 16,
          ),
        ),
      ]),
    );
  }

  Widget _buildDivider(double endIndent) {
    return Divider(
      height: 30,
      color: MyColors.myYellow,
      thickness: 2,
      endIndent: endIndent,
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return randomQuotesOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget randomQuotesOrEmptySpace(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuotesIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: MyColors.myWhite,
            shadows: [
              Shadow(
                blurRadius: 7,
                offset: Offset(0, 0),
                color: MyColors.myYellow,
              ),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FadeAnimatedText(quotes[randomQuotesIndex].quote),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getRandomQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: CustomScrollView(
        slivers: [
          _buildSilverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _characterInfo(
                        'job:',
                        character.jobs.join('/'),
                      ),
                      _buildDivider(335),
                      _characterInfo(
                        'Appeared in:',
                        character.categoryForTowSeries,
                      ),
                      _buildDivider(265),
                      _characterInfo(
                        'Seasons:',
                        character.appearanceOfSeasons.join('/'),
                      ),
                      _buildDivider(300),
                      _characterInfo(
                        'Status:',
                        character.statusIfDeadOrAlive,
                      ),
                      _buildDivider(315),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : _characterInfo(
                              'Better Call Saul:',
                              character.betterCallSaulAppearance.join('/'),
                            ),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : _buildDivider(235),
                      _characterInfo(
                        'Actor/Actress:',
                        character.actorName,
                      ),
                      _buildDivider(250),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
