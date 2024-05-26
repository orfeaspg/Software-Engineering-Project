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