###### 18/10/2022 - SilverHawks - Garry's Mod Addons
#
# <center>Simple Magic System 2</center>


## C'est quoi ?
<br/>

#### Simple Magic System 2 est un script permettant d'instaurer un système de magie pour vos serveur Garry's Mod. Le script est crée pour être le plus simple possible d'utilisation tout en étant efficace en répondant aux plus de besoins possible.

<br>

## Features

- Configuration des Magie InGame
- Une gestion de la progression différente suivant la magie
- Un joueur peut avoir plusieurs magie
- Système de Reroll de magie

## Commands:

➽ !addmana "Player" "Number" - Add mana to a player
➽ !setmana "Player" "Number" - Set a player's man to a given value (superadmin)
➽ !addreroll "Player" "Number" - Add reroll to a player (superadmin)

## For developers:

if you want to use mana usage more efficiently you can directly set mana usage to 0 and use the following function:

➽ SMS_Main.Energyuse(player, unit)

example in a swep I can put in the primaryattack:

➽ SMS_Main.Energyuse(self.Owner, 10)

Warning, the function is used on the server side only!


## DO NOT REUPLOAD.