#my script file for generating the json data file

$texts = @("Merry Christmas","Happy Holidays","HO-HO-HO","Vrolijk Kerstfeest",
  "Joyeux Noël","Frohe Weihnachten","Hyvää Joulua","Glædelig Jul","Kala Christouyenna",
  "Mele Kalikimaka","Buon Natale","Merry Xmas","Merry Christmas & A Happy New Year",
  "Meri Kuri","God Jul","Nollaig Chridheil","Feliz Navidad",
  "Schöni Wiehnachte","Mutlu Noeller","Nadolig Llawen","toDwI'ma' qoS yItIvqu'"
   )

$first = "Toby","Bernard","Princess","Harvey","Chuck","Doris","Elsa",
"Snookums","Honey","Norm","Coco","Sven","Inga","Boris",
"Benedict","Sunshine","Kiki","Nutmeg","Humperdink","Jack",
"Bertha","Matilda","Clarice","Dwight","Hermey","Rupert","Lady",
"Izzy","Timmy","Tammy","Enoch","Suzie","Esmerelda","Doc"

$mod = "Ginger","Glitter","Frosty","Sugar","Sour","Pepper",
"Minty","Crazy","Spicy","Pickle","Twinkle","Sparkle","Disco","Red",
"Green","Little","Big","Tiny","Glow","Shimmer","Dazzle","Winter","Jingle",
"Puffy","Fluffy","Saucy","Crinkle","Sticky"
    
$last = "pants","toes","bottom","beard","nose","puss","lips",
"ears","socks","stockings","belly","cheeks","bells","chin",
"mctush","sticks","fish","whisker","boots","slippers","knicker",
"knocker","muffin","puff","heels","knees"

$presents = "Socks","Barbie","Elmo","XBox","GI Joe","Underwear",
"Hot Wheels","EZ Bake Oven","Walkman","PS4","Pajamas","Stratego",
"Ginzu Knives","Chia Pet","Tie","Mittens","Bicycle","Pony","Battleship",
"Cabbage Patch Doll","Tie","Slippers","Sled","Bourbon","Coloring book"

[pscustomobject]@{
 Greeting = $texts
 FirstNames = $first
 Modifiers = $mod
 LastNames = $last
 Presents = $presents

} | ConvertTo-Json | Set-Content -Path .\data.json



