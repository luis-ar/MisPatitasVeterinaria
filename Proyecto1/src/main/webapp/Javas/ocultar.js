const hamburguesa=document.querySelector(".hamburguesa");
const navegacionEncabezado=document.querySelector(".navegacionEncabezado");
let pase=true;
hamburguesa.addEventListener("click",()=>{
    if(pase){
            navegacionEncabezado.style.display="flex";
pase=false;
    }else{
                    navegacionEncabezado.style.display="none";

        pase=true;
    }
});

