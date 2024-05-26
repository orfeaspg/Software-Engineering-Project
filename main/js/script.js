const forms = document.querySelector(".forms"),
    pwShowHide = document.querySelectorAll(".eye-icon"),
    links = document.querySelectorAll(".link");

pwShowHide.forEach(eyeIcon => {
    eyeIcon.addEventListener("click", () => {
        let pwFields = eyeIcon.parentElement.parentElement.querySelectorAll(".password");

        pwFields.forEach(password => {
            if (password.type === "password") {
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


//login
document.getElementById('loginForm')?.addEventListener('submit', function(event) {
    event.preventDefault();
    let formData = new URLSearchParams(new FormData(event.target)).toString();
    console.log(formData);
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            let messageElement = document.getElementById('message');
            if (data.status === 'success') {
                window.location.href = data.redirectUrl;
            } else {
                messageElement.style.color = 'red';
                messageElement.textContent = data.message;
            }
        })
        .catch(error => console.error('Error:', error));
});

window.onload = function (){
    fetch('/get-username')
        .then(response => response.json())
        .then(data => {
            if (data.username) {
                document.querySelector('#username').textContent = data.username;
            }
        })
        .catch(error => console.error('Error:', error));
};

//logout
document.getElementById('logoutButton').addEventListener('click', function() {
fetch('/logout', {
    method: 'POST'
})
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            window.location.href = data.redirectUrl;
        }
    })
    .catch(error => console.error('Error:', error));
});

//admin exclusive pages
document.addEventListener('DOMContentLoaded', (event) => {
    fetch('/get-role')
        .then(response => response.json())
        .then(data => {
            if (data.role_id !== 2) {
                document.querySelector('#adminLink').style.display = 'none';
            }
        })
        .catch(error => console.error('Error:', error));
});