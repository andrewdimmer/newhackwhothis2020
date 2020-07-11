import firebaseApp from "./firebaseConfig";

export const hackathonFirestoreRootRef = firebaseApp
  .firestore()
  .collection("hackathons")
  .doc("NewHackWhoThis2020");
