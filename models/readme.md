# Description of the models

All models were trained using `Manu McFrench` (doi: [10.5281/zenodo.6657808](https://doi.org/10.5281/zenodo.6657808)) as a base model, using data from the [data/train/](../data/train).

- `Peraire_ft_MMCFR` was trained and tested using [peraire-ground-truth v.1.0.0](https://github.com/alix-tz/peraire-ground-truth/releases/tag/v1.0.0), the eScriptorium web application and Kraken v. 3.0.13. This is equivalent to consider that it was trained and tested solely on the transcriptions from the B series.
- `peraire2_ft_MMCFR` was trained using [peraire-ground-truth v.2.0.0](https://github.com/alix-tz/peraire-ground-truth/releases/tag/v2.0.0) and Kraken v. 4.3.7. :star:
- `peraireB_ft_MMCFR` was trained using only the transcriptions from the B series of [peraire-ground-truth v.2.0.0](https://github.com/alix-tz/peraire-ground-truth/releases/tag/v2.0.0) and Kraken v. 4.3.7.
- `peraireD_ft_MMCFR` was trained using only the transcriptions from the D series of [peraire-ground-truth v.2.0.0](https://github.com/alix-tz/peraire-ground-truth/releases/tag/v2.0.0) and Kraken v. 4.3.7.


| model             | dataset version | trained on   | tested on   | testing software                                                             | accuracy on test set |
|:-----------------:|-----------------|--------------|-------------|------------------------------------------------------------------------------|----------------------|
| Peraire_ft_MMCFR  | 1.0.0           | train/*.xml  | test/*.xml  | [Kamilib 0.1.1 via KamiApp](https://huggingface.co/spaces/lterriel/kami-app) | 93.30 %              |
| peraire2_ft_MMCFR | 2.0.0           | train/*.xml  | test/*.xml  | [CERberus 1.0.0](https://github.com/WHaverals/CERberus)                      | 95.38 %              |
| "                 | 2.0.0           | train/*.xml  | test/B*.xml | [CERberus 1.0.0](https://github.com/WHaverals/CERberus)                      | 93.59 %              |
| "                 | 2.0.0           | train/*.xml  | test/D*.xml | [CERberus 1.0.0](https://github.com/WHaverals/CERberus)                      | 96.46 %              |
| peraireB_ft_MMCFR | 2.0.0           | train/B*.xml | test/B*.xml | [CERberus 1.0.0](https://github.com/WHaverals/CERberus)                      | 92.88 %              |
| "                 | 2.0.0           | train/B*.xml | test/D*.xml | [CERberus 1.0.0](https://github.com/WHaverals/CERberus)                      | 90.31 %              |
| peraireD_ft_MMCFR | 2.0.0           | train/D*.xml | test/*.xml  | [CERberus 1.0.0](https://github.com/WHaverals/CERberus)                      | 96.01 %              |
| "                 | 2.0.0           | train/D*.xml | test/B*.xml | [CERberus 1.0.0](https://github.com/WHaverals/CERberus)                      | 61.47 %              |


<!--

`Peraire_ft_MMCFR` accuracy during training is 93.0%. It reaches an accuracy of 93.3% in the test files.



## KaMI-App evaluation

> (ran on August 12 with kamilib 0.1.1-light)

|FIELD1                                |Default|Ignoring digits|Ignoring case|Ignoring punctuation|Ignoring diacritics|Combining all options|
|--------------------------------------|-------|---------------|-------------|--------------------|-------------------|---------------------|
|Levensthein Distance (Char.)          |378    |373            |373          |319                 |336                |266                  |
|Levensthein Distance (Words)          |256    |251            |252          |211                 |227                |169                  |
|Hamming Distance                      |Ø      |Ø              |Ø            |Ø                   |Ø                  |Ø                    |
|Word Error Rate (WER in %)            |26.947 |26.873         |26.526       |22.542              |23.894             |18.51                |
|Char. Error Rate (CER in %)           |6.723  |6.731          |6.634        |5.909               |6.095              |5.108                |
|Word Accuracy (Wacc in %)             |73.052 |73.126         |73.473       |77.457              |76.105             |81.489               |
|Match Error Rate (MER in %)           |6.645  |6.652          |6.557        |5.853               |6.031              |5.065                |
|Char. Information Lost (CIL in %)     |10.52  |10.45          |10.352       |9.328               |9.863              |8.327                |
|Char. Information Preserved (CIP in %)|89.479 |89.549         |89.647       |90.671              |90.136             |91.672               |
|Hits                                  |5310   |5234           |5315         |5131                |5235               |4985                 |
|Substitutions                         |229    |221            |224          |196                 |222                |177                  |
|Deletions                             |83     |86             |83           |71                  |55                 |45                   |
|Insertions                            |66     |66             |66           |52                  |59                 |44                   |
|Total char. in reference              |5622   |5541           |5622         |5398                |5512               |5207                 |
|Total char. in prediction             |5605   |5521           |5605         |5379                |5516               |5206                 |


<!--

## Reference:
```
Je suis reçu par la SUPERIEURE, une réligieuse d'
une cinquantaine d'année aussi et une française. Elle me
demande le but de mon voyage, et ne peut arriver à
croire que je puisse ainsi me faire comprendre grâce
à l'Esperanto. Elle doute beaucoup, qu'un jour
l'Esperanto, sera obligatoirement enseigné dans toutes
les Ecoles des pays civilisés, helas! Elle est réaliste.
NOTA 1930 et 1966
TEL EST POURTANT NOTRE BUT: tant au point
de vue RATIONEL, qu#'IDEOLOGIQUE. Etant une SYNTHESE
des langues modernes vivantes, l'étude de l'Esperanto éviterait
des pertes INSOUPÇONNÉES de temps, que l'on pourrait
dédier ainsi à une vraie CULTURE GENERALE INTER-
-PEUPLES ET INTERPOPULAIRE. Je suis toujours convain-
-cu que cette mesure serait un FACTEUR IMPORTANT
de PAIX INTERNATIONALE. MAIS LA VEUX-T-ON
CETTE PAIX REELLEMENT ? (fin du nota)
Pour ma part, me dit-elle, vous soulevez
un voile devant mes yeux. Et en tout cas vous
obtiendrez un résultat INESPÉRÉ si vous pouviez
REELLEMENT CONVAINCRE LE PAPE et son entourage
(J'en suis convaincu aussi, mais comme je l'ai dit
haut
plus x veut-on réellement dans tous les milieux
ORGANISER LA PAIX ? Si oui qui veut la
fin, veut les moyens, et l'Esperanto peut-être
sûrement UN DE CES MOYENS.).
46
esperantigo numenata
MANIFOLD N°18 commencé à Libourne le 3-11-68.
Fini
le 24-4-69
la 21an. 1.75a
extrait du carnet steno N°16 (suite de la page 50 du manifold N°17)
TCHAN-DGIA LE LUNDI 7 DECEMBRE 1930. Pour conclure cette soirée....
maussade, Mr LOU qui me quitte vers les 20h, me dit : - "En
réalité en Chine, présentement l'on se distrait en cercles fermés
dans les réceptions, que s'offrent les notables entre-eux ; le
peuple fait de même, mais rien n'est prévu ni organisé
présentement, pour le menu peuple ; nous avons trop à faire
par ailleurs.".
Hier dimanche, vers les 11 heures, Mr OU-I. le chef
du KUO-MIN-TANG, m'amena chez le général en chef de la
province. Je suis reçu, par un homme en uniforme, mais
sans aucun insigne apparent: Notre premier contact est
sympathique, il me reçoit sans pompe, sans céremonie, tout
simplement. La résidence était gardée par tout un
contingent de soldats, qui bien entendu, nous empêchent
d'entrer. Apres quelques mots de Mr OU-I, ceux-ci se
figent en un garde à vous impeccable; et nous introduisent
dans le bureau d'un capitaine, qui nous saluent
respectueusement et nous présente des sièges. Par telé,
il avertit le général de notre visite. C'est un grand
honneur que l'on me fait, et cependant, j'étais tres calme
et me disais: - "Il te faut jouer serré". De ces quelques
minutes dépend peut-être ma vie, ma liberté où tout au
1
il devra acheter tous ses bagages et papiers ; à moi il
ne me demande rien. Plus loin, je croise une troupe de
dames qui repend dans l'air un flot de parfums suaves et
qui nous devisagerent d'un air moqueur. (Nous étions passablement
crottés et mouillés).
Dans un hôtel, on veut bien nous vendre
un morceau de pain noir pour 7 kouronnes mais on refuse de
nous loger pour la nuit. Nous continuons donc notre route.
La nuit commence à tomber. Dans un pré, nous avisons
quelques femmes qui gardent les vaches. Nous leur faisons
comprendre que nous desirerions trouve un endroit sur pour
pouvoir camper. Le premier geste de méfiance passé, ces braves
paysannes nous acceptent. et nous font entrer dans la ferme. et
complètent notre souper avec du lait. à peine sommes-nous
couchés dans la grange qu'un formidable orage eclate et
durera toute la nuit. Heureusement que nous avons 2 couvertures
car le froid arrive très vif.
MARDI 25 SEPTEMBRE 1928. Décidément nous garderons un souvenir
profond de cette régions des Carpathes. La pluie continue
et nous ne pouvons repartir que vers les 9h. Quand nous
voulons dedommager cette brave femme, elle nous repond : "Le
bon Dieu me le rendra". Sous la pluie qui diminue
une 1/2h après P crève sa roue AV, et ça nous fait perdre
1h pour réparer. Entre temps le soleil s'est levé, et vers
10h nous arrivons au village de JASINA. Bientôt la
route est coupée par les eaux. Nous sommes obligés d'accomplir
de véritables tous d'acrobatie pour traverses ce goulet.
5
les boiseries du poste d'équipage sont en bois
exotiques vernis. Le parquet est en bois huilé et le
plafond peint en blanc. Les 2/3 du salon sont séparés par
une petite barriere et bois peint en blanc pour amenager dans
l'autre tiers, le "coin de Lénine" ; c'est un cabinet avec piano
des bancs et la radio
Les 3 rangées de table de la salle à manger sont
couvertes par des toiles cirées et le service est assuré par une
femme. A cet effet, tout à côté il y a la buanderie, la
cuisine (chauffée au mazout) (en 1929).
J'ai egalement visité, l'atelier de mécanique et de menuiserie
amenagés à bord.
LUNDI 20 MARS 1929. Hier j'ai visité à environ 10k au
sud de Novorassisk, au bord de la mer, un magnifique
vignoble. Il y a un petit village de paysans où vivent
là
une cinquantaine de personnes. Avant la Revolution ce
vignoble appartenait à un propriétaire, et il est devenu proprié-
-té d'Etat. Il y a là quelque 200 à 300 hectares de
terres bien exposées au sud. sur le flanc d'une colline
située au Nord. Elle est travaillée par les anciens ouvriers
agricoles et par des "artels" = coopé au premier degré, d'ouvriers
Le "chateau" - comme en France est une superbe
(toute neuve)
bâtisse située au milieu du vignoble, et la vinification.
comme en France - se fait dans des bâtiments qu'il
entourent
En ce moment, le "chateau" est occupe par
uune colonie de "BEZPRIOZORNII" - anciens enfants
43
```

## Prediction

```
Je suis reçu par la SUPERIEVRE, une réligieuse d
une conquantaine d'anée aussi, et une française. Alle me
demande le but de mon voyage, et ne peut arriver à
croué que je puuisse ainsi me faue comprendre grace
à l'Esperanto. Elle doute beaucoup, qu'un jour
l'Eperante, sera obligatoirement enseigné dans toutes
les Ecoles des pays civlisés, helas. Elle est réaliste.
NOTA 1930 et 1906
TEL EST POURTANT NOTRE BOT, tant au point
do vuie RATIONEL, Que IDEOLOGIQUE. Etant une SUNTHESE
Des lanques modernes vivantes, l'étude de l'Espesanto éviteran
des pertes INSOUECONNCES de temps, que l'on pourrait
dedier ainsi à une vade CIITUNE GEMEARLE IMTED-
PEIPLES ET INTERPOEULAIRE. Je suis toujours convain-
c, que cette mesure serait un FACTEUR IMIPORTANT
de PAIK ITITERHATIONALE. MAIS LA VEUK-T-ON
CETTE PAIK REELLEMENT ? (fun du nota)
Pour ma part, me dit-elle, vous soulevez
un voile devant mes yeux. Et en tout cas vous
obtiendriez un résultat MHESPERE. Si vous pouviez
REEHEHENT CONVAINCRE LE PAVE et son entourage
J'en suis convainen aussi, mais, comme je l'ai dit
hauit
plus rveut-on reellement dans tous les milieux
ORGANISER LA DAIK . Si oui qui veut la
fon, veut les moyens, et l'Esperanto peut être
surement UN DE CES MIOVENS.).
46
esperankigs sumenita
MANICOLO N° 18, commencé à Lbourse le 3-1168.
Sini
le 24-4-68
la 210-1.750
extrait du carnet steno N°16- (Suite de la page 50 du manifold N°17)
(HAN- DENA LE LUNOI 7 DECENBRE 1930. Pour conclure cette soirée...
maussade. Mr 2Oi qui me quitte vers les 20h, me dit: -lEn
réalité en Chine, présentement l'on se distrait en cercles fermes
dans les réceptions, que s'offrent les notables entre eux: le
peuple fait de même, mais rien n'est prévu m'organisé
présentement, pour le menu, peuple; nous avans trop à faire
par ailleurs ?.
Mier dimanche, vers les, 11 heures, Mr OU -1- le chef
du KUO-HIN-TANE, m'amena chez le général en chef de la
province. Je suis reçu, par un homme en uniforme, mais
sans aucun insigne apparent. Notre premier contait est
sympathique, il me reçoit sans pompe, sans ceremonié, tout
simplement. La résidence était gardée par tout un
contingent de soldats, qui bien entendu, nous empêchent
d'entrer. Après quelques mots de Mr OU-1-, ceux- ci se
figent en un garde à vous impeccable., et nous introduisent
dans le bureau d'un capitaine, qui, nous saluent
respectueusement, et nous presente des sièges. Par telé,
il avertit le général de notre visite. C'est un grand
honneur que l'on me fait, et cependant, j'étois tres calme
et me disais: -" Il te faut jouer serré". De ces quelques
minutes, dépend peut être mu rie, ma leiberte où tout au
1
il dera extuber tous ses bagages et papiers; à moi il
ne me temande aien. Plus loin p croise une troupe de
anses qui apenit beons l'anr, un pot de parfirms sueuves et
ui nous devisagerent d'un air moqueur. (Nous etions possablement
crottés et mouillés).
Dans un hôtel  veut bien nous venitre
un morceau de pain nour pour I kouronnes mais on refusse de
nous lager pour la nuit. Nous continuons dine notre route.
La nuit commence à tomber. Dans un pre, nous avisons
quilques femmes qui gardent les vaches. Nous deur faisons
comprendre que nous désirerions trouver un enirois see pour
pouvour camper.. Le premier geste de mifiane passé, ces traves
paysannes nous acceptent. et nous font entrer dans la ferme, et
completent notre souper auc du lait. a peiné sommes nous
couches (dans la gronge qu'un formidable orage eclate, et
detrera toute la niit, Neurcusement que nous avons 2 couvertures
car le froid arrive très vyj..
MARN 25 SEPTENSRE 1928. Dieullemment, nous gartiron un souvenier
profanndt de cette regions des Carpathes.. La pluie continne
et nous ne pouvons réparter que vers les 5h. Qurandt nous.
poulons dedommager cette brave femme, elle nous repond. Le
bon Dieu me le rendrà. Sous la pluie qui diminue
une 12 h après P crève su roue N. et ca nous fait perdre
1h pour reparer. Entre semps le solul s'est levé, et vers
1oh nous arrivons au village de JASIMA. Bientot la
route est coupée par les caux. Nous sommes obliges dte'auomplir
de veritabtes tours l'acrobatie pour travorsir ce goulet.
5
Les bosseries du poste d'équipage sont en bois
exotiques vernis. Le parquet est en bois huité et le
plafend peint en blanc.. Les 2/3 du salon sont séparés par
une patite barrière et bois peint en blane pour amenager dans
l'autre tions, le "coin de Léniné" ; c'est un cabinet avec piano
des banes et la nadio
Les 3 rangées de table de la salle à manger sont
couvertes par des toiles corces et le service est assuré par une
femme. A cet effet, tout à coté il y a la buanclerie, la
cuisine (chauffée au mazant) Cen 1929)
J'ai egalement vrsuté. l'atelier de mécanique et de menuusert
aménages à bort.
LONOI 20 MARS 1929. Mier j'ai visité à environ 10k au
suit de illivorassisk, au bord de la mer, un magnifique
vignoble. Il y a un petit village de paysans où ritent
là
une cinquantaine de personnes. Avant la Révolution ce
vignoble appartenait à un propriétaire, et il est divenu proprie-
-te d'Etat. Il j'a là quelque 200 à 300 hectares de
terres bien expotes au sud. sur le flane d'une colliné
située au evord... Elle est travaillée par les anciens ouvriers
agucoles et par des "'artils - coapé au premier degré, d'ouvriers
Le "chateau" - comme en France est une superte
toute neuve)
batisse située au milicu du vignoble, et la vinification,
comme en Frence - se fait dans des bâtiments quil
entourent
En ce moment, le "chateau" est occupe par
uune cotonie de SEEPRIEORNI - anciens enfants
43
```
-->