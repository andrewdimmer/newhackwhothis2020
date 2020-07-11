export const matchingAlgorithm = (
  studentInfo1: StudentData,
  studentInfo2: StudentData
) => {
  let score = 0;

  // Same Class Level
  if (
    studentInfo1.classLevel.indexOf(studentInfo2.classLevel) === 0 &&
    studentInfo2.classLevel.indexOf(studentInfo1.classLevel) === 0
  ) {
    score += 6;
  }

  // Share Classes
  const classes1 = studentInfo1.classes.map(
    (classData) => classData.dept + " " + classData.number
  );
  for (const classData of studentInfo2.classes) {
    if (classes1.indexOf(classData.dept + " " + classData.number) >= 0) {
      score += 3;
    }
  }

  // Same (or similar) Dorm
  if (
    studentInfo1.dorm.dorm.indexOf(studentInfo2.dorm.dorm) === 0 &&
    studentInfo2.dorm.dorm.indexOf(studentInfo1.dorm.dorm) === 0
  ) {
    score += 6;
    // Bonus for same floor
    if (
      studentInfo1.dorm.floor === studentInfo2.dorm.floor &&
      studentInfo2.dorm.floor === studentInfo1.dorm.floor
    ) {
      score += 6;
    }
  }

  // Score from Questions
  const questions1 = studentInfo1.questions.reduce<{ [key: number]: number }>(
    (object, questionAnswer) => {
      object[questionAnswer.questionNumber] = questionAnswer.answerIndex;
      return object;
    },
    {}
  );
  for (const questionAnswer of studentInfo2.questions) {
    if (
      questions1[questionAnswer.questionNumber] === questionAnswer.answerIndex
    ) {
      score += 1;
    }
  }

  // Return the final score
  return score;
};
