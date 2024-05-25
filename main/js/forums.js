
// Sidebar
const menuItems = document.querySelectorAll('.menu-item');

// Suggestions
const messageNotification = document.querySelector('#messages-notifications');
const messages = document.querySelector('.suggestions');
const message = messages.querySelectorAll('.suggestion');

// ============== TABS ==============
window.onload = function() {
    document.getElementById("userPostsButton").click();
};
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

fetch('/api/data')
    .then(response => response.json())
    .then(data => {
        const resultsContainer = document.querySelector('#query-results');
        data.forEach(item => {
            const resultItem = document.createElement('p');
            resultItem.textContent = item.description; // replace 'your_column' with the actual column name you want to display
            resultsContainer.appendChild(resultItem);
        });
    })
    .catch(error => console.error('Error:', error));