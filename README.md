# **The adventures of Ebi Bambino**

## Introduction

I have created my own text adventure game in Ruby.

## My Approach
I created four classes for this challenge:
 - game
 - player
 - room
 - world

The game class handles ho the game is played and is the main class. it contains the method which starts the game.

The player class only contains the position of the player and will be further expanded upon in the future

The room class is what is used to define each new room in the game.

The world class takes in yaml files and generates the game world for that instance.

## How To Use It

 You should have ruby version 2.2.3 or above

 first clone the repo
 ```
 https://github.com/ChukaEbi/text-adventure
 ```

 then run ```play.rb```

## Improvements

General code cleanup needs to take place. I also would like to create a more immersive experience. First by adding an Item class which can aid the player in some manner.Then I would like to create a battle system complete with Monsters and possible coop.
