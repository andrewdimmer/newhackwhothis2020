import * as functions from "firebase-functions";
import {
  approveEndpoint,
  matchEndpoint,
  rejectEndpoint,
} from "./endpoints/approveRejectMatchEndpoints";
import { createNewStudentEndpoint } from "./endpoints/createUserEndpoint";
import {
  getMatchesEndpoint,
  getToApproveEndpoint,
} from "./endpoints/getDataEndpoints";

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript
export const helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Firebase!");
});

// Create User Endpoints
export const newhackwhothis2020_create_new_student = createNewStudentEndpoint;

// Get Data Endpoints
export const newhackwhothis2020_get_to_approve = getToApproveEndpoint;
export const newhackwhothis2020_get_matches = getMatchesEndpoint;

// Approve, Reject, Match Endpoints
export const newhackwhothis2020_approve = approveEndpoint;
export const newhackwhothis2020_reject = rejectEndpoint;
export const newhackwhothis2020_match = matchEndpoint;
