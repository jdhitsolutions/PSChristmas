$texts = @("Merry Christmas", "Happy Holidays", "HO-HO-HO", "Vrolijk Kerstfeest", "Joyeux No?l", "Frohe Weihnachten", "Hyv?? Joulua", "Gl?delig Jul", "Kala Christouyenna", "Mele Kalikimaka", "Buon Natale", "Merry Xmas", "Merry Christmas & A Happy New Year", "Meri Kuri", "God Jul", "Nollaig Chridheil", "Feliz Navidad", "Sch?ni Wiehnachte", "Mutlu Noeller", "Nadolig Llawen", "toDwI'ma' qoS yItIvqu'", "??????????? ?????????", "Priec?gus Ziemassv?tkus", "Vesel Bo?i?", "Vesel? Vianoce", "Vesel? V?noce", "Feliz Natal", "???? ????????????", "Boldog Kar?csonyt", "Let it snow, let it snow, let it snow", "Have a holly,jolly Christmas", "Peace"
)

$first = @("Toby", "Bernard", "Princess", "Harvey", "Chuck", "Doris", "Elsa", "Snookums", "Honey", "Norm", "Coco", "Sven", "Inga", "Boris", "Benedict", "Sunshine", "Kiki", "Nutmeg", "Humperdink", "Jack", "Bertha", "Matilda", "Clarice", "Dwight", "Hermey", "Rupert", "Lady", "Izzy", "Timmy", "Jason", "Tammy", "Enoch", "Suzie", "Esmerelda", "Doc", "Matilda", "Kevin", "Bob", "Sleepy", "Dopey", "Snazzy", "Paula", "Izzy", "Wizzy", "Tizzy", "Todd", "Zippy", "Moonlight", "Luna", "Hermione", "Pepper", "Pip", "Pop", "Gilligan", "Captain", "Kip", "Diogones", "Archimedes", "Fred", "Sneezy", "Prof.","Dr.","Queen","Abner","Dot","Starlight","Misty","Dusty")

$mod = @("Ginger", "Glitter", "Frosty", "Sugar", "Sour", "Pepper", "Minty", "Crazy", "Spicy", "Pickle", "Twinkle", "Sparkle", "Disco", "Red", "Green", "Little", "Big", "Tiny", "Glow", "Shimmer", "Dazzle", "Winter", "Jingle", "Puffy", "Fluffy", "Saucy", "Crinkle", "Sticky", "Purple", "Dizzy", "Crumple", "Jumble", "Stinky", "Stuffy", "Smelly", "Drizzle", "Fizzle", "Spotted", "Zany", "Zippy", "Pumpkin", "Doozy", "Woozy", "Scuzzy", "Furry", "Dusty", "Yellow", "Pink")

$last = @{"pants", "toes", "bottom", "beard", "nose", "puss", "lips", "ears", "socks", "stockings", "belly", "cheeks", "bells", "chin", "mctush", "sticks", "fish", "whisker", "boots", "slippers", "knicker", "knocker", "muffin", "puff", "heels", "knees", "toe", "knickerknocker", "fluff", "fingers", "eyes", "buckle", "butt", "lobes", "knuckles","wind","end","gas","top","nuts"}

$presents = @("Socks", "Barbie", "Elmo", "XBox", "GI Joe", "Underwear", "Hot Wheels", "EZ Bake Oven", "Walkman", "PS4", "Pajamas", "Stratego", "Ginzu Knives", "Chia Pet", "Tie", "Mittens", "Bicycle", "Pony", "Battleship", "Cabbage Patch Doll", "Slippers", "Sled", "Bourbon", "Coloring book", "Risk", "Clue", "Mystery Date", "Rock'em Sock'em Robots", "rocks", "Tesla", "puppy", "kitten", "baby goat", "VCR", "Parcheesi", "Transformers", "Bedazzler", "painting set", "iPad", "xBox", "Wii", "Scotch", "iPhone", "Jarts","Creepy Crawlers","Connect Four","Vodka")

[PSCustomObject]@{
  Greeting   = $texts
  FirstNames = $first
  Modifiers  = $mod
  LastNames  = $last
  Presents   = $presents

} | ConvertTo-Json | Set-Content -Path .\data.json -Encoding Unicode
