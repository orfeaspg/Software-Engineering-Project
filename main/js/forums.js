// Sidebar
const menuItems = document.querySelectorAll('.menu-item');

// Suggestions
const messageNotification = document.querySelector('#messages-notifications');
const messages = document.querySelector('.suggestions');
const message = messages.querySelectorAll('.suggestion');

// ============== TABS ==============
function openPage(evt, pageName) {
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(pageName).style.display = "block";
    evt.currentTarget.className += " active";

    var suggestedUsers = document.getElementById('suggestedUsers');
    var websitesToFollow = document.getElementById('websitesToFollow');
    var createPostForm = document.getElementById('createPostForm');

    if (pageName === 'UserPosts') {
        suggestedUsers.style.display = 'block';
        websitesToFollow.style.display = 'none';
        createPostForm.style.display = 'flex';
    } else if (pageName === 'Articles') {
        suggestedUsers.style.display = 'none';
        websitesToFollow.style.display = 'block';
        createPostForm.style.display = 'none';
    }
}

document.getElementById("createPostButton").addEventListener("click", function() {
    document.getElementById("userPostsButton").click();
});

document.addEventListener('DOMContentLoaded', (event) => {
    swal({
        title: "Good job!",
        text: "You clicked the button!",
        icon: "info",
        closeOnClickOutside : false,
        timer: 2500
    });
});

window.onload = function (){
    document.getElementById("userPostsButton").click();
    fetch('/get-username')
        .then(response => response.json())
        .then(data => {
            if (data.username) {
                document.querySelector('#username').textContent = "@"+data.username;
                document.querySelector('#username-forum').textContent = "@"+data.username;
                document.querySelector('#name-surname-forum').textContent = data.name+" "+data.surname;
                document.querySelector('#profile-photo').setAttribute('src', data.profile_picture);
            }
        })
        .catch(error => console.error('Error:', error));

    fetch('/forum-articles')
        .then(response => response.json())
        .then(data => {
            let forumArticles = document.querySelector('#articles-query');
            forumArticles.innerHTML = data.map(link => {
                return `<div class="feed" id="single-article">
                            <div class="head">
                                <div class="user">
                                    <div class="info">
                                        <h3>${link.title}</h3>
                                        <small>8 Hours Ago</small>
                                    </div>
                                </div>
                                <span class="edit">
                                    <i class="uil uil-ellipsis-h"></i>
                                </span>
                            </div>

                            <div class="photo">
                                <img src="${link.thumbnail_path}">
                            </div>

                            <div class="action-buttons">
                                <div class="interaction-buttons">
                                    <span><i class="uil uil-heart"></i></span>
                                    <span><i class="uil uil-comment-dots"></i></span>
                                    <span><i class="uil uil-share-alt"></i></span>
                                </div>
                                <div class="bookmark">
                                    <span><i class="uil uil-bookmark-full"></i></span>
                                </div>
                            </div>

                            <div class="liked-by">
                                <span><img src="./main/images/profile-10.jpg"></span>
                                <span><img src="./main/images/profile-4.jpg"></span>
                                <span><img src="./main/images/profile-15.jpg"></span>
                                <p>Liked by <b>Benjamin Dwayne</b> and <b>2, 323 others</b></p>
                            </div>

                            <div class="caption">
                                <p><b>Indiana Ellison</b> ${link.description}</p>
                                    <span class="harsh-tag">#lifestyle</span></p>
                            </div>

                            <div class="comments text-muted">
                                View all 277 comments
                            </div>
                        </div>`
            }).join('');
        })
        .catch(error => console.error('Error:', error));
    fetch('/forum-posts')
        .then(response => response.json())
        .then(data => {
            let forumPosts = document.querySelector('#posts-query');
            forumPosts.innerHTML = data.map(link => {
                return `<div class="feed">
                            <div class="head">
                                <div class="user">
                                    <div class="profile-photo">
                                        <img src="${link.profile_picture}">
                                    </div>
                                    <div class="info">
                                        <h3>${link.name+" "+link.surname}</h3>
                                        <small>Dubai, 15 Minutes Ago</small>
                                    </div>
                                </div>
                                <span class="edit">
                                    <i class="uil uil-ellipsis-h"></i>
                                </span>
                            </div>

                            ${link.thumbnail_path ? `<div class="photo">
                                <img src="${link.thumbnail_path}">
                            </div>` : ''}
                        
                            <div class="action-buttons">
                                <div class="interaction-buttons">
                                    <span><i class="uil uil-heart"></i></span>
                                    <span><i class="uil uil-comment-dots"></i></span>
                                    <span><i class="uil uil-share-alt"></i></span>
                                </div>
                                <div class="bookmark">
                                    <span><i class="uil uil-bookmark-full"></i></span>
                                </div>
                            </div>

                            <div class="liked-by">
                                <span><img src="./main/images/profile-10.jpg"></span>
                                <span><img src="./main/images/profile-4.jpg"></span>
                                <span><img src="./main/images/profile-15.jpg"></span>
                                <p>Liked by <b>Ernest Achiever</b> and <b>2, 323 others</b></p>
                            </div>

                            <div class="caption">
                                <p><b>Lana Rose</b> Lorem ipsum dolor sit quisquam eius.
                                <span class="harsh-tag">#lifestyle</span></p>
                            </div>

                            <div class="comments text-muted">
                                View all 277 comments
                            </div>
                        </div>`
            }).join('');
        })
        .catch(error => console.error('Error:', error));
    fetch('/forum-websites')
        .then(response => response.json())
        .then(data => {
            let forumWebsites = document.querySelector('#forum-websites');
            forumWebsites.innerHTML = data.map(link => {
                return `<div class="suggestion">
                        <div class="profile-photo">
                            <img src="${link.thumbnail_path}">
                        </div>
                        <div class="suggestion-body">
                            <h5>${link.name}</h5>
                            <p class="text-muted">${link.description}</p>
                        </div>
                    </div>`
            }).join('');
        })
        .catch(error => console.error('Error:', error));
    fetch('/forum-users')
        .then(response => response.json())
        .then(data => {
            let forumUsers = document.querySelector('#forum-users');
            forumUsers.innerHTML = data.map(link => {
                return `<div class="suggestion">
                        <div class="profile-photo">
                            <img src="${link.profile_picture}">
                        </div>
                        <div class="suggestion-body">
                            <h5>${link.name} ${link.surname}</h5>
                        </div>
                    </div>`
            }).join('');
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