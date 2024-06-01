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
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            let messageElement = document.getElementById('login-message');
            if (data.status === 'success') {
                window.location.href = data.redirectUrl;
            } else {
                messageElement.style.color = 'red';
                messageElement.textContent = data.message;
            }
        })
        .catch(error => console.error('Error:', error));
});

//signup
document.getElementById('Signup')?.addEventListener('submit', function(event) {
    event.preventDefault();
    let formData = new URLSearchParams(new FormData(event.target)).toString();
    fetch('/sign-up', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            let messageElement = document.getElementById('sign-up-message');
            if (data.status === 'success') {
                window.location.href = data.redirectUrl;
            } else {
                messageElement.style.color = 'red';
                messageElement.textContent = data.message;
            }
        })
        .catch(error => console.error('Error:', error));
});

//contact form
document.getElementById('contactForm')?.addEventListener('submit', function(event) {
    event.preventDefault();
    let formData = new URLSearchParams(new FormData(event.target)).toString();
    fetch('/contact-us', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
        .then(response => response.json())
        .then(data => {
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

//get username
window.onload = function () {
    fetch('/get-username')
        .then(response => response.json())
        .then(data => {
            if (data.username) {
                document.querySelector('#username').textContent = "@" + data.username;
                document.querySelectorAll('.profile-photo').forEach(element => element.setAttribute('src', data.profile_picture));
            }
        })
        .catch(error => console.error('Error:', error));
    if (document.querySelector('#externalLinks')) {
        fetch('/external-links')
            .then(response => response.json())
            .then(data => {
                let externalLinks = document.querySelector('#externalLinks');
                externalLinks.innerHTML = data.map(link => {
                    return `<div class="article">
                        <h3>${link.title}</h3>
                        <p>${link.description}</p>
                        <img src="${link.thumbnail_path}" alt="Article 1" style="width: 100px; height: auto;">
                        <a href="${link.url}">See more</a>
                       </div>`
                }).join('');
            })
            .catch(error => console.error('Error:', error));
    }
    if (document.querySelector('#chatRoom')) {
        fetch('/chat-rooms')
            .then(response => response.json())
            .then(data => {
                let chatRooms = document.querySelector('#chatRoom');
                chatRooms.innerHTML = data.map(link => {
                    return `<div class="chat-room">
            <h2 class="chat-room__title">${link.title}</h2>
            <p class="chat-room__description">${link.description}</p>
            <a href="#" class="chat-room__join-btn" onclick="showModal('${link.title}')">Join</a>
        </div>`
                }).join('');
            })
            .catch(error => console.error('Error:', error));
    }
    // Fetch recent entries only if the element exists
    if (document.querySelector('#recent-entries-list')) {
        fetch('/diary-content')
            .then(response => response.json())
            .then(entries => {
                const recentEntriesList = document.getElementById('recent-entries-list');
                recentEntriesList.innerHTML = '';
                entries.forEach(entry => {
                    const listItem = document.createElement('li');
                    const entryLink = document.createElement('a');
                    entryLink.href = `/diary-entry.html?id=${entry.id}`;
                    entryLink.textContent = entry.title;
                    listItem.appendChild(entryLink);
                    recentEntriesList.appendChild(listItem);
                });
            })
            .catch(error => console.error('Error fetching recent entries:', error));
    }
};

//logout
document.getElementById('logoutButton')?.addEventListener('click', function () {
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
    if(document.querySelector('#adminLink')){
        fetch('/get-role')
            .then(response => response.json())
            .then(data => {
                if (data.role_id !== 2) {
                    document.querySelector('#adminLink').style.display = 'none';
                }
            })
            .catch(error => console.error('Error:', error));
    }
});