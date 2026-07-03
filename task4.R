students_na <- data.frame(
  Name = c("Aisha", "Bryan", "Chloe", "Daniel", "Emily"),
  Gender = c("Female", "Male", "Female", "Male", "Female"),
  Age = c(22, NA, 21, 24, 22),
  Test_Score = c(85, 78, NA, 65, 88),
  Attendance = c(90, 85, 95, NA, 88)
)

is.na(students_na)
sum(is.na(students_na))
colSums(is.na(students_na))

students_na$Age[is.na(students_na$Age)] <- mean(students_na$Age, na.rm = TRUE)

students_na$Test_Score[is.na(students_na$Test_Score)] <- median(students_na$Test_Score, na.rm = TRUE)

students_na$Attendance[is.na(students_na$Attendance)] <- 0

students_na
