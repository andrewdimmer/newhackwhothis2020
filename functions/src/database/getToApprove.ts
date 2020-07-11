import { getStudentScoreCollectionRef } from "./collectionHelpers";
import { logReturnFactory } from "../helpers/errorHelpers";

export const getToApprove = async (studentEmail: string) => {
  return getStudentScoreCollectionRef(studentEmail)
    .where("status", "<=", 3)
    .where("status", ">=", 2)
    .orderBy("status", "desc")
    .orderBy("score", "desc")
    .get()
    .then((queryResults) => {
      return queryResults.docs.map((currentDoc) => {
        return currentDoc.data() as ScoreObject;
      });
    })
    .catch(logReturnFactory<ScoreObject[]>([]));
};
