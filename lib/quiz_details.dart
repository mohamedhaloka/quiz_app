class Quiz {
  static Map quizs = {
    'What is your name?': 'Mohamed Nasr',
    'What is your age?': '19',
    'What is your address?': 'Mogam3 Elmahakem',
    'What is your Collage?': 'FCIS',
    'What is your Country?': 'Egypt',
    'What is your City?': 'Mansoura',
    'What is your Father Name?': 'Nasr',
    'What is your Last Name?': 'Haloka',
    'What is your Favourite Lang': 'Arabic',
    'What is your Academy year?': '3',
    'What is your App Name?': 'QUIZ',
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
      '10 street',
    ],
    [
      'FCIS',
      'FCES',
      'FP',
      'FL',
    ],
    [
      'Egypt',
      'Libia',
      'Algeria',
    ],
    [
      'Mansoura',
      'Alexandria',
    ],
    [
      'Nasr',
      'Eslam',
      'Mahmoud',
    ],
    [
      'Haloka',
      'Sari4',
      'Lotfy',
    ],
    [
      'English',
      'Arabic',
      'Germany',
    ],
    [
      '3',
      '2',
      '1',
      '4',
    ],
    [
      'The quiz',
      'quiz app',
      'QUIZ',
      'QUIZzZ',
    ],
  ];
}
