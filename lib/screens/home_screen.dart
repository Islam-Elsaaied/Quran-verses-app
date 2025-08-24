import 'package:flutter/material.dart';
import '../data/verses_data.dart';
import '../models/verse_model.dart';
import '../widgets/mood_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedVerse = '';
  String verseReference = '';

  void _showVerse(String mood) {
    if (moodVerses[mood] != null && moodVerses[mood]!.isNotEmpty) {
      final random = (DateTime.now().millisecondsSinceEpoch % moodVerses[mood]!.length);
      final verseData = Verse.fromMap(moodVerses[mood]![random]);
      
      setState(() {
        selectedVerse = verseData.text;
        verseReference = verseData.reference;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'آيات للحالات النفسية',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // رسالة ترحيبية
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.teal.shade200),
                ),
                child: Text(
                  'اختر حالتك النفسية الحالية لتحصل على آية قرآنية مناسبة تساعدك',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              // شبكة الأزرار
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                children: [
                  MoodButton(
                    mood: 'حزين',
                    color: Colors.blue.shade600,
                    icon: Icons.sentiment_very_dissatisfied,
                    onPressed: _showVerse,
                  ),
                  MoodButton(
                    mood: 'سعيد',
                    color: Colors.green.shade600,
                    icon: Icons.sentiment_very_satisfied,
                    onPressed: _showVerse,
                  ),
                  MoodButton(
                    mood: 'قلق',
                    color: Colors.orange.shade600,
                    icon: Icons.psychology,
                    onPressed: _showVerse,
                  ),
                  MoodButton(
                    mood: 'خائف',
                    color: Colors.red.shade600,
                    icon: Icons.warning,
                    onPressed: _showVerse,
                  ),
                  MoodButton(
                    mood: 'غاضب',
                    color: Colors.red.shade800,
                    icon: Icons.angry,
                    onPressed: _showVerse,
                  ),
                  MoodButton(
                    mood: 'متعب',
                    color: Colors.grey.shade600,
                    icon: Icons.tired_face,
                    onPressed: _showVerse,
                  ),
                  MoodButton(
                    mood: 'وحيد',
                    color: Colors.indigo.shade600,
                    icon: Icons.person,
                    onPressed: _showVerse,
                  ),
                  MoodButton(
                    mood: 'مُمتن',
                    color: Colors.purple.shade600,
                    icon: Icons.favorite,
                    onPressed: _showVerse,
                  ),
                ],
              ),
              
              SizedBox(height: 30),
              
              // عرض الآية المختارة
              if (selectedVerse.isNotEmpty) ...[
                Container(
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade100, Colors.teal.shade50],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade200.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        selectedVerse,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal.shade800,
                          height: 1.8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade600,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          verseReference,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              
              SizedBox(height: 30),
              
              // رسالة تحفيزية
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb, color: Colors.amber.shade700, size: 30),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        'تذكر أن القرآن الكريم شفاء للقلوب وراحة للنفوس',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.amber.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}