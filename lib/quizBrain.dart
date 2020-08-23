import 'question.dart';
import 'dart:math';
class QuizBrain{

  int _score=0;
  int _totalQuestionsAsked = 1;
  int qnum = 0;

  List<Questions> _quizQuestions = [
    Questions('He was martyred in the Battle of Mu’ta. He later became known as Zul Janahain (The winged one) because Rasoolullah (صلى الله عليه و سلم) remarked about him, “Allāh has granted him two wings in place of his arms. He flies in Jannah wherever he wishes. What was his name?','Ja\'far','Dalha','Ubay','Thabit',1),
    Questions('Which Sahabi was known to be the most just?','Abbakr','Umar','Uthman','Ali',1),
    Questions('Which Sahabi did Rasoolullah (صلى الله عليه و سلم) send to spy upon the enemy in The Battle of the Trench?','Ibn Abbas','Khalid','Huzaifah','Anas',3),
    Questions('Which Sahabiyah in Madinatul Munawwarah used to represent the women when approaching Rasoolullah (صلى الله عليه و سلم) to discuss any matter?','Hafsa','Asma','Juwairiyya','Ruqayya',2),
    Questions('Which Sahabi was the last to pass away from the participants of Badr?','Saad Ibn Abi Waqas','Zubair bn -Awwam','Dalha','Ubaid-ul-lah',1),
    Questions('Which Sahabi was a Muhajir (Emigrant) as well as an Ansaar (Host)? Moreover, he was a slave as well as a free person. He ranked among the top Qurra.','Salman Al-Faris','Maq’al bin Sinan','Julaybib','Ibn Abbas',2),
    Questions('Which Sahabi was known to be the strictest in the matters of religion?','Abbkr','Umar','Uthman','Ali',2),
    Questions('Which Sahabi drank the blood of Rasoolullah (صلى الله عليه و سلم)? Rasoolullah (صلى الله عليه و سلم) then said, “The person who has my blood in his body cannot burn in Hell.”','Abdullah Ibn Abbas','Abdullah Ibn Quhafa','Abdullah Ibn Sinin','Abdullah Ibn Zubair',4),
    Questions('Before accepting Islam, his name was Shaytaan (The Devil). After embracing Islam what name did Rasoolullah (صلى الله عليه و سلم) choose for him?','Hazrat Abdullah Ibn Qurt','Ibn Khalifa','Ibn Kalbi','Ibn Hashir',1),
    Questions('Through the preaching of a certain Sahabi (رضي الله تعالى عنه), Sahabas such as Uthmaan bin Affan, Talhah bin Ubaidullah, Sa’ad bin Abi Waqaas & Abdur Rahman bin Auf entered Islam. What was the name of this Sahabi?',' Zubayr','Qays','Abbkr','Ubaid',3),
    Questions('The Mushrikeen threw him into a fire. Upon this Rasoolullah (صلى الله عليه و سلم) supplicated, “O Fire! Become cool and peaceful upon him just as you did for Ibrahim (عليه السلام).” What was this Sahabi name who did not burn in the fire?','Ammar bin Yaasir','Bilal bin Rabi\'a','Abdullah bn Amr','Abdullah bin As',1),
    Questions('Which Sahabi was known as Saahibul Kitabain (Bearer of two texts i.e. The Injeel and the Qur’aan)?','Uthman','Wahshi','Salman-il-Faris','Jabir',3),
    Questions('Which Sahabi saw  Jibraeel (عليه السلام) in his original form with Rasoolullah (صلى الله عليه و سلم)? Due to this overpowering sight he later became blind in his old age.','Ibn Sulaim','Ibn Abbas','Ibn Sina','Ibn Gifari',2),
    Questions('On the occasion of Hudaybiyah, a representative from the Makkans negotiated a peace treaty with the Muslims. He refused to write Bismillah and The Messenger of Allah on the document. After he embraced Islam, he was seen rubbing the shaven hair of Rasoolullah (صلى الله عليه و سلم) in his eyes on the occasion of Hajjatul Widaa trying to gain blessings. What was his name?','Bin As','Bin Qays','Suhail bin Amr','Amr bin Suhail',3),
    Questions('Hazrat Abu Talhah embraced Islam by the preaching of a Sahabiyah (رضي الله تعالى عنها). What was her name?','Ummu Kulsum','Ummu Abdullah','Ummu Salim','Ummu Sulaim',4),
    Questions('Which Sahabi was killed by a Jinn?','Sa’ad bin Ubadah (رضي الله تعالى عنه)','Sa\'eed','Salim','Salman',1),
    Questions('The two Sahaba whose staff became illuminated through the dua of Rasoolullah (صلى الله عليه و سلم) They received light through it on a very dark night in Madinah when they had come to the Masjid from a distant place. Which one is not among them?','Usaid bin Hudair','Abbad bin Bishr','Ubay Bn ka\'ab','',3),
    Questions('Which Sahabi married two daughters of Rasoolullah (صلى الله عليه و سلم) attaining the envious title of Zun Noorain (Possessor of two lights)?','Ali','Umar','Uthman','Zaid',3),
    Questions('Prior to the death of Rasoolullah (صلى الله عليه و سلم), he had dispatched a huge army under the leadership of a very young Sahabi. While the army was still on the outskirts of Madinah, Rasoolullah (صلى الله عليه و سلم) passed away. What was this young Sahabi name?','Ukhasha','Usama bin Zaid','Ubay','Uthman',2),
    Questions('The prophet (pbuh) once mentioned that if there had to be a Nabi after him, it would have been a certain Sahabi. Which Sahabi name was mentioned?','Abbkr','Umar','Uthman','Ali',2),
    Questions('Which Sahabi held the flag of Islam in the unit of Rasoolullah (صلى الله عليه و سلم) on the occasion of The Conquest of Makkah?','Zubyr bin Awwaam','Zaid','Khalid','Salman',1),
    Questions('Who did Rasoolullah (صلى الله عليه و سلم) send to Najran in the year 9 After Hijra as an instructor in Islamic studies? He later became the governor of Syria.','Abu Musa-Al-Ash\'ari','Abu Qatada','Abu Ubaida bin Jarrah','Abu Abdullah',3),
    Questions('Rasoolullah (صلى الله عليه و سلم) performed all the congregational salaah in his lifetime except on two occasions Behind two Sahabas. Which one is not among them?','Abu Bakr','Ibn Abbas','Abdur Rahman bin Auf','',2),
    Questions('One is not among the three Muftees of the Sahaba. Which one is that?','Abdullah ibn Mas’ood','Zaid bin Saabit','Abdullah ibn Umar','Zubyr Bn Awwam',4),
    Questions('Through the preaching of which Sahabi did Hazrat Abu Hurairah enter Islam?','Qurt','Tufail bin Amr Ad-Dowsi','Talha','Thabit',2),
    Questions('Who among the Sahabas did the prophet made this statement to \'He is from me and I\'m from him\'?','Ali','Khalid','Julaybib','Abbkr',3),
    Questions('What is the name of the Sahabi that Angel Jibreel usually took his human appearance to appear to the prophet and reveal message.','Wahshi','Najashi','Dihya Ibn khalifa alkalbi','Quhafa',3),
    Questions('What\'s the name of the person that killed Sayyidina Hamza','Najashi','Wahshi','Quraishi','Hashimi',2),
    Questions('One among the top Sahabas did not attend battle of Badar.','Abbkr','Umar','Uthman','Ali',3),
    Questions('The prophet said to one Sahabi upon his recitation \'Your voice sounds like prophet Dawud\'. Which Sahabi is that?','Ibn Abbas','Abdullah Ibn Mas`ud','Ibn Umm Makhtum','Ibn jahsh',2),
    Questions('He was martyred in a battle and Hence the Angels Bathed him and was nicknamed \'Gaseelul Malaaikah\', which means the one bathed by the angels. Who was that Sahabi?','Hamza R.A','Hanzala R.A ','Huzaifa R.A','Umair R.A',2),
    Questions('“He travels alone, he lives alone, he will die alone and he will be raised on the Day of Resurrection alone.” who was that Sahabi?','Abu Musa-Al-Ash\'ari','Abu Hurayra','Abu Dharr','Abu-d-Darda\'',3),
    Questions('The throne [of Allah] shook at His death. Who was that Sahabi?','Sa`ad Bin Mu`adh','Sa`eed','Jabir','Jarir',1),
    Questions('They all looked like the prophet Muhammad (pbuh) in resemblance except one of these?','Ali','Ja\'afar','Fatima','Thalha',4),
    Questions('I heard your footsteps right in front of me inside Jannah..Said the prophet to one Sahabi. Who is that Sahabi?','Abbkr','Zubyr','Bilal','Umar',3),
    Questions('Which Sahabi asked the prophet (pbuh) to pray for his mother to accept Islam ?','Salman-Al-Faris','Abu huraira','Ammar','Mus`ab Ibn Umayr',2),
    Questions('Which Sahabi put his captive kafir brother for ransom after the battle of Badr?','Salman-Al-Faris','Abu huraira','Ammar','Mus`ab Ibn Umayr',4),
    Questions('Which Sahabi\'s wife stood up for him and said he couldn\'t forbid her from going to the masjid ?','Hamza','Khalid','Umar','Zubyr',3),
    Questions('Which Sahabi risked his life voluntarily for prophet Muhammad (pbuh)?','Abbkr','Umar','Ja\'afar','Ali',4),
    Questions('Which Sahabi died while performing ablution (making Wudu\') in Sham / Syria?','Abdullah ibn Bishr RA','Ibn Abbas','Ibn Jahsh','Ibn Umar',1),
    Questions('Before accepting Islam he had ten wives. Rasoolullah (صلى الله عليه و سلم) instructed him to divorce six and keep four. What was his name?','Qurtubi','Kalbi','Ghailan bin Sulamah','Dimad',3),
    Questions('Which Sahabi sent a written invitation of Islam to Rustam, a leader in Persia?','Umar','Ali','Khalid','Mugeera',3),
    Questions('Which Sahabi did the prophet Muhammad (pbuh) called "The living martyr"','Talha Bin Ubaydillah R.A','Ubay','Umar','Abbkr',1),
    Questions('Which Sahabi was called the "Amin\' of this Ummah"? (The most trust worthy)','Abu Ubaidah Amer Bin Al Jarrahh R.A','Amr','Qays','Yasir',1),
    Questions('Which sahabi did the angles use to give the salam to ?','Āmir','Imraan ibn Husayn','Affaan','Zulaifa',2),
    Questions('Who was the first one to put mats in the masjid?','Abbkr','Omar','Othman','Ali',2),
    Questions('How many times did Bilal raise the Azan after the death of the prophet (pbuh)','Once','Twice','Thrice','Four Times',1),
    Questions('Who said non of the women can give a birth to someone like Khaled Bn Walid?','Abbkr','Umar','Uthman','Ali',1),
    Questions('Who was the prophet\'s (pbuh) writer?','Ibn Rabi\'a','Ibn Al\'arbaa','Abdullah ibn rawaha','Ibn Mu\'addal',3),
    Questions('To which sahabi did the prophet (pbuh) gave a Dua\' to meet Allāh smiling','Ibn Rabi\'a','Talha ibn Alabraa (RA)','Ibn Rawaha','Ibn Mu\'addal',2)
  ];
  List <int> questionsAsked=[];

  int getScore()
  {
    return _score;
  }

  String getQuestion(){
    return _quizQuestions[qnum].question;
  }

  String getAnswer(){
    return getChoice(_quizQuestions[qnum].ans); //This fetches the ans no and plugs it in the getChoice to return the correct answer
  }

  int getTotalQuestionsAsked(){
    return _totalQuestionsAsked;
  }

  void nextQuestion() { //verifies that the index of question is unique and updates the data member qnum to the new question number
    this.qnum = Random().nextInt(_quizQuestions.length);      //This whole segment gets a random generated index for the question to be asked

    while (questionsAsked.contains(this.qnum)) {
      this.qnum = Random().nextInt(_quizQuestions.length);
    }
    questionsAsked.add(this.qnum); //Add this question index into the asked list
    print(qnum.toString() + ' was asked, questions asked so far ' + questionsAsked.length.toString());
  }

  bool checkAnswer(int selection){
    bool isCorrect = false;
    if(selection == _quizQuestions[qnum].ans)
    {
      _score++;
      isCorrect = true;
      print('picked the correct answer ' + _score.toString());
    } else
    {
      print('picked the wrong answer');
    }
    _totalQuestionsAsked++; //regardless, question has been asked and button has been pressed
    return isCorrect;
  }
  String getChoice(int butChoice){
    String choiceText;
    switch(butChoice){
      case 1: choiceText = _quizQuestions[qnum].choice1;
      break;
      case 2: choiceText = _quizQuestions[qnum].choice2;
      break;
      case 3: choiceText = _quizQuestions[qnum].choice3;
      break;
      case 4: choiceText = _quizQuestions[qnum].choice4;
      break;
    }
    return choiceText;
  }


  void reset(){
    qnum=0;
    _score=0;
    _totalQuestionsAsked=1;
    questionsAsked.clear();
  }

}