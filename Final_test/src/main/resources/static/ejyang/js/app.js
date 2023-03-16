// show & hide password
var eye_icon_signup = document.getElementById('eye_icon_signup');
var eye_icon_login = document.getElementById('eye_icon_login');
var sign_up_password = document.getElementById("signup_password");
var login_password = document.getElementById("login_password");
eye_icon_signup.addEventListener('click', ()=>{
    hideAndShowPass(eye_icon_signup, signup_password); 
});
eye_icon_login.addEventListener('click', ()=>{
    hideAndShowPass(eye_icon_login, login_password);  
});

const hideAndShowPass = (eye_icon, password) => {
    if(eye_icon.classList.contains("fa-eye-slash")){
        eye_icon.classList.remove('fa-eye-slash');
        eye_icon.classList.add('fa-eye');
        password.setAttribute('type', 'text');
        
    }
    else{
        eye_icon.classList.remove('fa-eye');
        eye_icon.classList.add('fa-eye-slash');
        password.setAttribute('type', 'password');
    }
};