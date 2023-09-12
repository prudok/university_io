class Schedule {
  Schedule(
    this.id,
    this.subjectId,
    this.groupId,
    this.teacherId,
    this.weekday,
    this.startTime,
    this.endTime,
  );

  int id;
  int subjectId;
  int groupId;
  int teacherId;
  String weekday;
  String startTime;
  String endTime;
}
