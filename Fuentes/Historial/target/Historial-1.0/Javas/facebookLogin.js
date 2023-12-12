import {
  FacebookAuthProvider,
  signInWithPopup,
} from "https://www.gstatic.com/firebasejs/10.3.1/firebase-auth.js";
import { auth } from "./firebase.js";

const facebookButon = document.querySelector("#facebookLogin");
facebookButon.addEventListener("click", () => {
  const provider = new FacebookAuthProvider();
  try {
    const credenciales = signInWithPopup(auth, provider);
    console.log(credenciales);
  } catch (error) {
    console.log(error);
  }
});
