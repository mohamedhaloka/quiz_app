class Quiz {
  static Map quizs = {
    'What is your name?': 'Mohamed Nasr',
    'What is your age?': '19',
    'What is your address?': 'Mogam3 Elmahakem'
  };
  List quizQuestions = quizs.keys.toList();

  List quizAnswers = quizs.values.toList();

  List<List> answers = [
    [
      'Mohamed Nasr',
      'Ahmed Haloka',
    ],
    [
      '20',
      '19',
      '18',
    ],
    [
      'Mogam3 Elmahakem',
      'elaxandria',
    ],
  ];

}
