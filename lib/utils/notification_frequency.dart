enum NotificationFrequency {
  month(30),
  weeks_2(14),
  week(7),
  days_5(5),
  days_3(3),
  days_1(1),
  day(0);

  final int days;

  const NotificationFrequency(this.days);
}
