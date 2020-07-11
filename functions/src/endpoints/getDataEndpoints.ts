import * as functions from "firebase-functions";
import { getMatches } from "../database/getMatches";
import { getToApprove } from "../database/getToApprove";

export const getToApproveEndpoint = functions.https.onRequest(
  (request, response) => {
    response.setHeader("Access-Control-Allow-Origin", "*"); // TODO: Make more secure later!
    getToApprove(request.body)
      .then((studentsToApprove) => {
        response.status(200).send({ toApprove: studentsToApprove });
      })
      .catch((err) => {
        console.log(err);
        response
          .status(500)
          .send(`Unable to get students to approve for ${request.body}`);
      });
  }
);

export const getMatchesEndpoint = functions.https.onRequest(
  (request, response) => {
    response.setHeader("Access-Control-Allow-Origin", "*"); // TODO: Make more secure later!
    getMatches(request.body)
      .then((studentsToApprove) => {
        response.status(200).send({ toApprove: studentsToApprove });
      })
      .catch((err) => {
        console.log(err);
        response.status(500).send(`Unable to get matches for ${request.body}`);
      });
  }
);
