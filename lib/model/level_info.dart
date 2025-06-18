class LevelInfo {
  final String level;
  final int currentCount;
  final int targetCount;
  final int progress;

  LevelInfo({
    required this.level,
    required this.currentCount,
    required this.targetCount,
    required this.progress,
  });
}

enum CategoryLevel {
  tour("여행지 %d곳을 완료 해보세요!", "여행 병아리", "방랑가", "콜럼버스"),
  culture("문화시설 %d곳을 체험 해보세요!", "관람객", "예술람", "Art 그 자체"),
  event("축제 %d곳을 즐겨보세요!", "가볍게 즐기는 사람", "축제에 미쳐버린 사람", "내가 바로 MC"),
  activity("액티비티 %d개를 즐겨보세요!", "뉴비", "고인물", "통달한 사람"),
  food("식당 %d곳을 방문해보세요!", "맛집 찾아 헤매는 뉴비", "고독한 미식가", "먹방 신");

  final String subTitleFormat;
  final String beginnerLevel;
  final String intermediateLevel;
  final String advancedLevel;

  const CategoryLevel(this.subTitleFormat, this.beginnerLevel, this.intermediateLevel, this.advancedLevel);
}