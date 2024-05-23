// Sidebar
const menuItems = document.querySelectorAll('.menu-item');

// Suggestions
const messageNotification = document.querySelector('#messages-notifications');
const messages = document.querySelector('.suggestions');
const message = messages.querySelectorAll('.suggestion');

// ============== SIDEBAR ============== 

// Remove active class from all menu items
/*const changeActiveItem = () => {
    menuItems.forEach(item => {
        item.classList.remove('active');
    })
}

menuItems.forEach(item => {
    item.addEventListener('click', () => {
        changeActiveItem();
        item.classList.add('active');
        if(item.id != 'notifications') {
            document.querySelector('.notifications-popup').
            style.display = 'none';
        } else {
            document.querySelector('.notifications-popup').
            style.display = 'block';
            document.querySelector('#notifications .notification-count').
            style.display = 'none';
        }
    })
})

// ============== THEME / DISPLAY CUSTOMIZATION ============== 

// Opens Modal
const openThemeModal = () => {
    themeModal.style.display = 'grid';
}

// Closes Modal
const closeThemeModal = (e) => {
    if(e.target.classList.contains('customize-theme')) {
        themeModal.style.display = 'none';
    }
}


// ============== FONT SIZE ============== 

// remove active class from spans or font size selectors
const removeSizeSelectors = () => {
    fontSize.forEach(size => {
        size.classList.remove('active');
    })
}

// Remove active class from colors
const changeActiveColorClass = () => {
    colorPalette.forEach(colorPicker => {
        colorPicker.classList.remove('active');
    })
}


//Theme Background Values
let lightColorLightness;
let whiteColorLightness;
let darkColorLightness;

// Changes background color
const changeBG = () => {
    root.style.setProperty('--light-color-lightness', lightColorLightness);
    root.style.setProperty('--white-color-lightness', whiteColorLightness);
    root.style.setProperty('--dark-color-lightness', darkColorLightness);
}
*/
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

diaryLink.addEventListener("click", () => {
    window.location.href = "personal-diary.html";
});

const homeLink = document.getElementById("home");

homeLink.addEventListener("click", () => {
    window.location.href = "FirstPage.html";
});
