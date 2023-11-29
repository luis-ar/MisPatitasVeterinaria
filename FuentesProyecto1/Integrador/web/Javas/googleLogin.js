import {
  GoogleAuthProvider,
  signInWithPopup,
} from "https://www.gstatic.com/firebasejs/10.3.1/firebase-auth.js";
import { auth } from "./firebase.js";

const googleButon = document.querySelector("#googleLogin");
googleButon.addEventListener("click", () => {
  const provider = new GoogleAuthProvider();
  try {
    const credenciales = signInWithPopup(auth, provider);
    console.log(credenciales);
  } catch (error) {
    console.log(error);
  }
});
