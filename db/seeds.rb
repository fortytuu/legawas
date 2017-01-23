# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Topic.all.destroy_all
Topic.create(title: 'Deutsch', description: 'Wähle ein Thema, das du üben möchtest.')
Topic.create(title: 'Mathe', description: 'Wähle einen Aufgabenbereich, den du üben möchtest.')

Category.all.destroy_all
topic_id = Topic.find_by(title: 'Deutsch').id
Category.create(topic_id: topic_id, short_title: 's/ss/ß', title: 'Die S-Laute (s, ss, ß)', response_options: [{name: "s", value: "s"}, {name: "ss", value: "ss"}, {name: "ß", value: "ß"}], amount: 5)
Category.create(topic_id: topic_id, short_title: 'i/ie', title: 'Die langen und kurzen i-Laute', response_options: [{name: "i", value: "i"}, {name: "ie", value: "ie"}], amount: 5)
Category.create(topic_id: topic_id, short_title: "e/ä", title: 'Ableiten zur Unterscheidung zwischen e und ä', response_options: [{name: "e", value: "e"}, {name: "ä", value: "ä"}], amount: 5)
Category.create(topic_id: topic_id, short_title: "eu/äu", title: 'Ableiten zur Unterscheidung zwischen eu und äu', response_options: [{name: "eu", value: "eu"}, {name: "äu", value: "äu"}], amount: 5)
Category.create(topic_id: topic_id, short_title: 'stummes h', title: 'Das stumme H', response_options: [{name: "h", value: "h"}, {name: "kein h", value: ""}], amount: 5)

SpellingTask.all.destroy_all
[['s/ss/ß','Ameise','Amei__e'],
['s/ss/ß','Adresse','Adre__e'],
['s/ss/ß','außen','au__en'],
['s/ss/ß','beißen','bei__en'],
['s/ss/ß','Besen','Be__en'],
['s/ss/ß','besser','be__er'],
['s/ss/ß','Bass','Ba__'],
['s/ss/ß','Biss','Bi__'],
['s/ss/ß','Boss','Bo__'],
['s/ss/ß','Blase','Bla__e'],
['s/ss/ß','blass','bla__'],
['s/ss/ß','bloß','blo__'],
['s/ss/ß','Dose','Do__e'],
['s/ss/ß','draußen','drau__en'],
['s/ss/ß','dreißig','drei__ig'],
['s/ss/ß','Einfluss','Einflu__'],
['s/ss/ß','Esel','E__el'],
['s/ss/ß','essen','e__en'],
['s/ss/ß','Fass','Fa__'],
['s/ss/ß','fassen','fa__en'],
['s/ss/ß','fleißig','flei__ig'],
['s/ss/ß','fließen','flie__en'],
['s/ss/ß','Floß','Flo__'],
['s/ss/ß','Flosse','Flo__e'],
['s/ss/ß','Fluss','Flu__'],
['s/ss/ß','fressen','fre__en'],
['s/ss/ß','Fuß','Fu__'],
['s/ss/ß','genießen','genie__en'],
['s/ss/ß','gießen','gie__en'],
['s/ss/ß','Glas','Gla__'],
['s/ss/ß','groß','gro__'],
['s/ss/ß','Größe','Grö__e'],
['s/ss/ß','Grüße','Grü__e'],
['s/ss/ß','Hase','Ha__e'],
['s/ss/ß','hassen','ha__en'],
['s/ss/ß','Haus','Hau__'],
['s/ss/ß','heiß','hei__'],
['s/ss/ß','heißen','hei__en'],
['s/ss/ß','Hose','Ho__e'],
['s/ss/ß','Insel','In__el'],
['s/ss/ß','Interesse','Intere__e'],
['s/ss/ß','Käse','Kä__e'],
['s/ss/ß','Kasse','Ka__e'],
['s/ss/ß','Kessel','Ke__el'],
['s/ss/ß','Kissen','Ki__en'],
['s/ss/ß','Klasse','Kla__e'],
['s/ss/ß','Klöße','Klö__e'],
['s/ss/ß','Kreis','Krei__'],
['s/ss/ß','Kurs','Kur__'],
['s/ss/ß','Kuss','Ku__'],
['s/ss/ß','lassen','la__en'],
['s/ss/ß','lesen','le__en'],
['s/ss/ß','Los','Lo__'],
['s/ss/ß','Maus','Mau__'],
['s/ss/ß','Messe','Me__e'],
['s/ss/ß','messen','me__en'],
['s/ss/ß','Messer','Me__er'],
['s/ss/ß','müssen','mü__en'],
['s/ss/ß','Nase','Na__e'],
['s/ss/ß','nass','na__'],
['s/ss/ß','Nuss','Nu__'],
['s/ss/ß','Pass','Pa__'],
['s/ss/ß','passen','pa__en'],
['s/ss/ß','Pause','Pau__e'],
['s/ss/ß','Preis','Prei__'],
['s/ss/ß','pressen','pre__en'],
['s/ss/ß','reißen','rei__en'],
['s/ss/ß','Riese','Rie__e'],
['s/ss/ß','Riss','Ri__'],
['s/ss/ß','Rüssel','Rü__el'],
['s/ss/ß','scheußlich','scheu__lich'],
['s/ss/ß','schießen','schie__en'],
['s/ss/ß','schließen','schlie__en'],
['s/ss/ß','schließlich','schlie__lich'],
['s/ss/ß','Schloss','Schlo__'],
['s/ss/ß','Schluss','Schlu__'],
['s/ss/ß','Schlüssel','Schlü__el'],
['s/ss/ß','schmeißen','schmei__en'],
['s/ss/ß','Schüssel','Schü__el'],
['s/ss/ß','Schweiß','Schwei__'],
['s/ss/ß','Sessel','Se__el'],
['s/ss/ß','Spaß','Spa__'],
['s/ss/ß','Spieß','Spie__'],
['s/ss/ß','Straße','Stra__e'],
['s/ss/ß','Strauß','Strau__'],
['s/ss/ß','Stress','Stre__'],
['s/ss/ß','süß','sü__'],
['s/ss/ß','Tasse','Ta__e'],
['s/ss/ß','vergessen','verge__en'],
['s/ss/ß','verlassen','verla__en'],
['s/ss/ß','Verweis','Verwei__'],
['s/ss/ß','Wasser','Wa__er'],
['s/ss/ß','weiß','wei__'],
['s/ss/ß','Wiese','Wie__e'],
['s/ss/ß','wissen','wi__en'],
['i/ie','Biss','B__ss'],
['i/ie','fließen','fl__ßen'],
['i/ie','genießen','gen__ßen'],
['i/ie','gießen','g__ßen'],
['i/ie','Insel','__nsel'],
['i/ie','Kissen','K__ssen'],
['i/ie','Riese','R__se'],
['i/ie','Riss','R__ss'],
['i/ie','schließen','schl__ßen'],
['i/ie','Spieß','Sp__ß'],
['i/ie','Wiese','W__se'],
['i/ie','wissen','w__ssen'],
['e/ä','besser','b__sser'],
['e/ä','Esel','__sel'],
['e/ä','Kessel','K__ssel'],
['e/ä','Messe','M__sse'],
['e/ä','Messer','M__sser'],
['e/ä','Sessel','S__ssel'],
['eu/äu','scheußlich','sch__ßlich'],
['stummes h','Bahn','Ba__n'],
['stummes h','belohnen','belo__nen'],
['stummes h','bezahlen','beza__len'],
['stummes h','bohren','bo__ren'],
['stummes h','erzählen','erzä__len'],
['stummes h','fahren','fa__ren'],
['stummes h','Fahrrad','Fa__rrad'],
['stummes h','Fahrt','Fa__rt'],
['stummes h','fehlen','fe__len'],
['stummes h','Fehler','Fe__ler'],
['stummes h','fröhlich','frö__lich'],
['stummes h','fühlen','fü__len'],
['stummes h','führen','fü__ren'],
['stummes h','Gefahr','Gefa__r'],
['stummes h','gefährlich','gefä__rlich'],
['stummes h','Höhle','Hö__le'],
['stummes h','Huhn','Hu__n'],
['stummes h','Jahr','Ja__r'],
['stummes h','kühl','kü__l'],
['stummes h','Lehne','Le__ne'],
['stummes h','Lehrerin','Le__rerin'],
['stummes h','mehr','me__r'],
['stummes h','nehmen','ne__men'],
['stummes h','ohne','o__ne'],
['stummes h','Ohr','O__r'],
['stummes h','Rahmen','Ra__men'],
['stummes h','Sahne','Sa__ne'],
['stummes h','sehr','se__r'],
['stummes h','Sohle','So__le'],
['stummes h','Sohn','So__n'],
['stummes h','stehlen','ste__len'],
['stummes h','Stuhl','Stu__l'],
['stummes h','Uhr','U__r'],
['stummes h','ungefähr','ungefä__r'],
['stummes h','Verkehr','Verke__r'],
['stummes h','wählen','wä__len'],
['stummes h','während','wä__rend'],
['stummes h','wohl','wo__l'],
['stummes h','wohnen','wo__nen'],
['stummes h','Wohnung','Wo__nung'],
['stummes h','Zahl','Za__l'],
['stummes h','zählen','zä__len'],
['stummes h','Zahn','Za__n'],
['stummes h','zehn','ze__n'],
['stummes h','Hase','Ha__se'],
['stummes h','super','su__per'],
['stummes h','Regen','Re__gen'],
['stummes h','reden','re__den'],
].each do |sub_array|
  category_id = Category.find_by(short_title: sub_array[0]).id
  solution_text = sub_array[1]
  fill_in_text = sub_array[2]
  SpellingTask.create(category_id: category_id, solution_text: solution_text, fill_in_text: fill_in_text)
end
