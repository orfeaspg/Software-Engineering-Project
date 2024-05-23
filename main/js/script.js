const forms = document.querySelector(".forms"),
      pwShowHide = document.querySelectorAll(".eye-icon"),
      links = document.querySelectorAll(".link");

pwShowHide.forEach(eyeIcon => {
    eyeIcon.addEventListener("click", () => {
        let pwFields = eyeIcon.parentElement.parentElement.querySelectorAll(".password");
        
        pwFields.forEach(password => {
            if(password.type === "password"){
                password.type = "text";
                eyeIcon.classList.replace("bx-hide", "bx-show");
                return;
            }
            password.type = "password";
            eyeIcon.classList.replace("bx-show", "bx-hide");
        })
        
    })
})      

links.forEach(link => {
    link.addEventListener("click", e => {
       e.preventDefault(); //preventing form submit
       forms.classList.toggle("show-signup");
    })
})

const usernameLink = document.getElementById("username-link");

usernameLink.addEventListener("click", () => {
    window.location.href = "user_profile.html";
});

const logoutLink = document.getElementById("logout-link");

logoutLink.addEventListener("click", () => {
    window.location.href = "loginForm.html";
});

const forumLink = document.getElementById("forum-link");

forumLink.addEventListener("click", () => {
    window.location.href = "forums.html";
});

const diaryLink = document.getElementById("personal-diary");
const diaryImageWrapper = document.querySelector(".diary-image-wrapper");

diaryLink.addEventListener("click", () => {
    window.location.href = "personal-diary.html";
});

diaryImageWrapper.addEventListener("click", () => {
    window.location.href = "personal-diary.html";
});


const homeLink = document.getElementById("home");

homeLink.addEventListener("click", () => {
    window.location.href = "FirstPage.html";
});
