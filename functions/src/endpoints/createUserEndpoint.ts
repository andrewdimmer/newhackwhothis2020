import * as functions from "firebase-functions";
import { createNewStudent } from "../database/createNewStudent";

export const createNewStudentEndpoint = functions.https.onRequest(
  (request, response) => {
    response.setHeader("Access-Control-Allow-Origin", "*"); // TODO: Make more secure later!
    const studentInfo = JSON.parse(request.body) as StudentData;
    createNewStudent(studentInfo)
      .then((studentsToApprove) => {
        response.status(200).send({ toApprove: studentsToApprove });
      })
      .catch((err) => {
        console.log(err);
        response
          .status(500)
          .send(`Unable to create student for ${studentInfo.email}`);
      });
  }
);
