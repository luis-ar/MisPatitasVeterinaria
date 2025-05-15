// Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.3.1/firebase-app.js";
import { getAuth } from "https://www.gstatic.com/firebasejs/10.3.1/firebase-auth.js";

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBe3rIsBkLIZz9jTpbP8p_6Sz0gxsdwQ-E",
  authDomain: "veterinaria-4ffa4.firebaseapp.com",
  projectId: "veterinaria-4ffa4",
  storageBucket: "veterinaria-4ffa4.appspot.com",
  messagingSenderId: "424332393510",
  appId: "1:424332393510:web:54eb9cfd5eea49712f3ae7",
  measurementId: "G-MH7QJ6GE92",
};

// Initialize Firebase
export const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
