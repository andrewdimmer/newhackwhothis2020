declare interface ScoreObject extends StudentData {
  score: number;
  status: number;
}

declare interface StudentData {
  firstName: string;
  lastName: string;
  email: string;
  classLevel: string;
  bio: string;
  questions: QAData[];
  classes: ClassData[];
  dorm: DormData;
}

declare interface QAData {
  questionNumber: number;
  answerIndex: number;
}

declare interface ClassData {
  dept: string;
  number: number;
}

declare interface DormData {
  dorm: string;
  floor?: number;
}
