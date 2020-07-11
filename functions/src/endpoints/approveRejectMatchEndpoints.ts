import * as functions from "firebase-functions";
import { approve, match, reject } from "../database/approveRejectMatch";

export const approveEndpoint = functions.https.onRequest(
  (request, response) => {
    response.setHeader("Access-Control-Allow-Origin", "*"); // TODO: Make more secure later!
    const requestBody = JSON.parse(request.body) as {
      approverEmail: string;
      approveeEmail: string;
    };
    approve(requestBody.approverEmail, requestBody.approveeEmail)
      .then((status) => {
        response.status(200).send(status);
      })
      .catch((err) => {
        console.log(err);
        response
          .status(500)
          .send(`Unable to approve ${requestBody.approveeEmail}`);
      });
  }
);

export const rejectEndpoint = functions.https.onRequest((request, response) => {
  response.setHeader("Access-Control-Allow-Origin", "*"); // TODO: Make more secure later!
  const requestBody = JSON.parse(request.body) as {
    rejecterEmail: string;
    rejecteeEmail: string;
  };
  reject(requestBody.rejecterEmail, requestBody.rejecteeEmail)
    .then((status) => {
      response.status(200).send(status);
    })
    .catch((err) => {
      console.log(err);
      response
        .status(500)
        .send(`Unable to reject ${requestBody.rejecteeEmail}`);
    });
});

export const matchEndpoint = functions.https.onRequest((request, response) => {
  response.setHeader("Access-Control-Allow-Origin", "*"); // TODO: Make more secure later!
  const requestBody = JSON.parse(request.body) as {
    matcherEmail: string;
    matcheeEmail: string;
  };
  match(requestBody.matcherEmail, requestBody.matcheeEmail)
    .then((status) => {
      response.status(200).send(status);
    })
    .catch((err) => {
      console.log(err);
      response.status(500).send(`Unable to match ${requestBody.matcheeEmail}`);
    });
});
