import { getStudentScoreDocRef } from "./collectionHelpers";
import { logReturnFactory } from "../helpers/errorHelpers";

export const approve = async (approverEmail: string, approveeEmail: string) => {
  return getStudentScoreDocRef(approverEmail, approveeEmail)
    .update({ status: 1 })
    .then(() => {
      return getStudentScoreDocRef(approveeEmail, approverEmail)
        .update({ status: 3 })
        .then(() => true)
        .catch(logReturnFactory(false));
    })
    .catch(logReturnFactory(false));
};

export const reject = async (rejecterEmail: string, rejecteeEmail: string) => {
  return getStudentScoreDocRef(rejecterEmail, rejecteeEmail)
    .delete()
    .then(() => {
      return getStudentScoreDocRef(rejecteeEmail, rejecterEmail)
        .delete()
        .then(() => true)
        .catch(logReturnFactory(false));
    })
    .catch(logReturnFactory(false));
};

export const match = async (matcherEmail: string, matcheeEmail: string) => {
  return getStudentScoreDocRef(matcherEmail, matcheeEmail)
    .update({ status: 4 })
    .then(() => {
      return getStudentScoreDocRef(matcheeEmail, matcherEmail)
        .update({ status: 4 })
        .then(() => true)
        .catch(logReturnFactory(false));
    })
    .catch(logReturnFactory(false));
};
