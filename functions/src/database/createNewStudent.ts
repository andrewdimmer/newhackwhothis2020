import {
  getStudentDocRef,
  getStudentCollectionRef,
  getStudentScoreDocRef,
} from "./collectionHelpers";
import { logReturnFactory } from "../helpers/errorHelpers";
import { matchingAlgorithm } from "../helpers/matchingAlgorithm";
import { getToApprove } from "./getToApprove";

export const createNewStudent = async (studentInfo: StudentData) => {
  const emptyScoreObjects: ScoreObject[] = [];
  return getStudentDocRef(studentInfo.email)
    .set(studentInfo)
    .then(() => {
      return getStudentCollectionRef(studentInfo.email)
        .get()
        .then((allStudentData) => {
          const dataToAddToTheDatabase = allStudentData.docs.map(
            (currentDoc) => {
              const data = currentDoc.data() as StudentData;
              const score = matchingAlgorithm(studentInfo, data);
              return {
                // To be included in the new student's collection
                forNewStudentScoreCollection: getScoreObjectFromStudentData(
                  data,
                  score
                ),
                // To be included in the existing student's collection
                forExistingStudentScoreCollection: getScoreObjectFromStudentData(
                  studentInfo,
                  score
                ),
              };
            }
          );

          const promises: Promise<boolean>[] = [];
          for (const scorePair of dataToAddToTheDatabase) {
            if (
              scorePair.forNewStudentScoreCollection.email.indexOf(
                studentInfo.email
              ) < 0
            ) {
              promises.push(
                addScoreDataToCollection(
                  studentInfo.email,
                  scorePair.forNewStudentScoreCollection
                )
              );
              promises.push(
                addScoreDataToCollection(
                  scorePair.forNewStudentScoreCollection.email,
                  scorePair.forExistingStudentScoreCollection
                )
              );
            }
          }

          return Promise.all(promises)
            .then((results) => {
              console.log(results.indexOf(false));
              if (results.indexOf(false) >= 0) {
                return emptyScoreObjects;
              }
              return getToApprove(studentInfo.email);
            })
            .catch(logReturnFactory(emptyScoreObjects));
        })
        .catch(logReturnFactory(emptyScoreObjects));
    })
    .catch(logReturnFactory(emptyScoreObjects));
};

const getScoreObjectFromStudentData = (
  studentInfo: StudentData,
  score: number
): ScoreObject => {
  return {
    firstName: studentInfo.firstName,
    lastName: studentInfo.lastName,
    email: studentInfo.email,
    bio: studentInfo.bio,
    classLevel: studentInfo.classLevel,
    classes: studentInfo.classes,
    dorm: studentInfo.dorm,
    questions: studentInfo.questions,
    score,
    status: 2,
  };
};

const addScoreDataToCollection = async (
  parentStudentEmail: string,
  scoreObject: ScoreObject
) => {
  return getStudentScoreDocRef(parentStudentEmail, scoreObject.email)
    .set(scoreObject)
    .then(() => true)
    .catch(logReturnFactory(false));
};
