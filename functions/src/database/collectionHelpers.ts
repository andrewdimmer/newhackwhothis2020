import { hackathonFirestoreRootRef } from "../config/firestoreConfig";

export const getStudentCollectionRef = (studentEmail: string) => {
  const school = studentEmail.substring(studentEmail.indexOf("@") + 1);

  return hackathonFirestoreRootRef
    .collection("schools")
    .doc(school)
    .collection("students");
};

export const getStudentDocRef = (studentEmail: string) => {
  const school = studentEmail.substring(studentEmail.indexOf("@") + 1);

  return hackathonFirestoreRootRef
    .collection("schools")
    .doc(school)
    .collection("students")
    .doc(studentEmail);
};

export const getStudentScoreCollectionRef = (studentEmail: string) => {
  return getStudentDocRef(studentEmail).collection("scores");
};

export const getStudentScoreDocRef = (
  parentStudentEmail: string,
  childStudentEmail: string
) => {
  return getStudentDocRef(parentStudentEmail)
    .collection("scores")
    .doc(childStudentEmail);
};
