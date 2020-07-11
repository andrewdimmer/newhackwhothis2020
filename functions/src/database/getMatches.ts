import { getStudentScoreCollectionRef } from "./collectionHelpers";
import { logReturnFactory } from "../helpers/errorHelpers";

export const getMatches = async (studentEmail: string) => {
  return getStudentScoreCollectionRef(studentEmail)
    .where("status", "==", 4)
    .orderBy("lastName", "asc")
    .orderBy("firstName", "asc")
    .get()
    .then((queryResults) => {
      return queryResults.docs.map((currentDoc) => {
        return currentDoc.data() as ScoreObject;
      });
    })
    .catch(logReturnFactory<ScoreObject[]>([]));
};
