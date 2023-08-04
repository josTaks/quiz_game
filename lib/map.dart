var listeMap = [
  {
    'père': 'voici pour lui',
    'mère': 'voici pour elle',
    'enfants': 'voici pour eux 1',
    'invités': 'voici pour eux',
  },
  {
    'père': 'voici pour lui',
    'mère': 'voici pour elle',
    'enfants': 'voici pour eux 2',
    'invités': 'voici pour eux',
  }
];

var listeDeListe = [
  [4, 1, 2],
  [1, 2, 3],
];

var maMap = {
  'premierPos': 1,
  'deuxiemePos': 2,
  'troisiemePos': 3,
};

class UneClasse {
  final String unePropriete;
  UneClasse({
    required this.unePropriete,
  });
}

void main() {
  // var unElement = maMap['premierPos'];
  // var unElement = listeDeListe[0][0];
  var index = 0;

  for (index = 0; index < listeMap.length; index++) {
    var unElement = listeMap[index]['enfants'];
    print('$index : $unElement');
  }
}
