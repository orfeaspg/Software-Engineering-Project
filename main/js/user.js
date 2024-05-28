// Sidebar
const menuItems = document.querySelectorAll('.menu-item');

// ============== SIDEBAR ============== 

// Remove active class from all menu items
const changeActiveItem = () => {
    menuItems.forEach(item => {
        item.classList.remove('active');
    })
}

menuItems.forEach(item => {
    item.addEventListener('click', () => {
        changeActiveItem();
        item.classList.add('active');
        if (item.id != 'notifications') {
            document.querySelector('.notifications-popup').style.display = 'none';
        } else {
            document.querySelector('.notifications-popup').style.display = 'block';
            document.querySelector('#notifications .notification-count').style.display = 'none';
        }
    })
})

window.onload = function () {
    fetch('/get-username')
        .then(response => response.json())
        .then(data => {
            if (data.username) {
                document.querySelector('#username').textContent = "@" + data.username;
                if (document.querySelector('#name-surname-profile' && '#username-profile')) {
                    document.querySelector('#username-profile').textContent = "@" + data.username;
                    document.querySelector('#name-surname-profile').textContent = data.name + " " + data.surname;
                }
            }
        })
        .catch(error => console.error('Error:', error));
    if(document.querySelector('#profile-posts')){
    fetch('/profile-posts')
        .then(response => response.json())
        .then(data => {
            console.log(data);
            let externalLinks = document.querySelector('#profile-posts');
            externalLinks.innerHTML = data.map(link => {
                return `<div class="feed">
                                <div class="head">
                                    <div class="user">
                                        <div class="profile-photo">
                                            <img src="./main/images/profile-13.jpg">
                                        </div>
                                        <div class="info">
                                            <h3>${link.name + " " + link.surname}</h3>
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
                                    <p>${link.description}
                                    <span class="harsh-tag">#lifestyle</span></p>
                                </div>
    
                                <div class="comments text-muted">
                                    View all 277 comments
                                </div>
                            </div>`
            }).join('');
        })
        .catch(error => console.error('Error:', error));
    }
};

//logout
document.getElementById('logoutButton').addEventListener('click', function () {
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

