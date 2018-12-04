$texts = @("Merry Christmas","Happy Holidays","HO-HO-HO","Vrolijk Kerstfeest",
  "Joyeux Noël","Frohe Weihnachten","Hyvää Joulua","Glædelig Jul","Kala Christouyenna",
  "Mele Kalikimaka","Buon Natale","Merry Xmas","Merry Christmas & A Happy New Year",
  "Meri Kuri","God Jul","Nollaig Chridheil","Feliz Navidad",
  "Schöni Wiehnachte","Mutlu Noeller","Nadolig Llawen","toDwI'ma' qoS yItIvqu'",
  "счастливого Рождества","Priecīgus Ziemassvētkus","Vesel Božič",
  "Veselé Vianoce","Veselé Vánoce","Feliz Natal","καλά Χριστούγεννα",
  "Boldog Karácsonyt","Let it snow, let it snow, let it snow",
  "Have a holly,jolly Christmas","Peace"
   )

$first = "Toby","Bernard","Princess","Harvey","Chuck","Doris","Elsa",
"Snookums","Honey","Norm","Coco","Sven","Inga","Boris",
"Benedict","Sunshine","Kiki","Nutmeg","Humperdink","Jack",
"Bertha","Matilda","Clarice","Dwight","Hermey","Rupert","Lady",
"Izzy","Timmy","Tammy","Enoch","Suzie","Esmerelda","Doc","Matilda",
"Kevin","Bob","Sleepy","Dopey","Snazzy","Izzy","Wizzy","Tizzy",
"Todd","Zippy","Moonlight","Luna","Hermione","Pepper","Pip","Kip",
"Diogones","Archimedes","Fred","Sneezy"

$mod = "Ginger","Glitter","Frosty","Sugar","Sour","Pepper",
"Minty","Crazy","Spicy","Pickle","Twinkle","Sparkle","Disco","Red",
"Green","Little","Big","Tiny","Glow","Shimmer","Dazzle","Winter","Jingle",
"Puffy","Fluffy","Saucy","Crinkle","Sticky","Purple","Dizzy","Crumple",
"Jumble","Stinky","Stuffy","Smelly","Drizzle","Fizzle","Spotted","Zany",
"Zippy","Pumpkin","Doozy","Woozy","Scuzzy","Furry"
    
$last = "pants","toes","bottom","beard","nose","puss","lips",
"ears","socks","stockings","belly","cheeks","bells","chin",
"mctush","sticks","fish","whisker","boots","slippers","knicker",
"knocker","muffin","puff","heels","knees","toe","knickerknocker",
"fluff","fingers","eyes","buckle","butt","lobes","knuckles",
"wind","gas"

$presents = "Socks","Barbie","Elmo","XBox","GI Joe","Underwear",
"Hot Wheels","EZ Bake Oven","Walkman","PS4","Pajamas","Stratego",
"Ginzu Knives","Chia Pet","Tie","Mittens","Bicycle","Pony","Battleship",
"Cabbage Patch Doll","Slippers","Sled","Bourbon","Coloring book",
"Risk","Clue","Mystery Date","Rock'em Sock'em Robots","rocks",
"Tesla","puppy","kitten","VCR","Parcheesi","Transformers","Bedazzler",
"painting set","iPad","xBox","Wii","iPhone","Jarts","Creepy Crawlers",
"Connect Four"

[pscustomobject]@{
 Greeting = $texts
 FirstNames = $first
 Modifiers = $mod
 LastNames = $last
 Presents = $presents

} | ConvertTo-Json | Set-Content -Path .\data.json -Encoding Unicode



