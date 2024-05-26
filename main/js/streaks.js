// Get the modals
const addStreakModal = document.getElementById('addStreakModal');
const calendarModal = document.getElementById('calendarModal');

// Get the buttons that open the modals
const addStreakButton = document.getElementById('addStreakButton');
const substanceButtons = document.querySelectorAll('.substance-button');

// Get the <span> elements that close the modals
const closeButtons = document.querySelectorAll('.modal .close');

// Open the first modal
addStreakButton.onclick = function() {
    addStreakModal.style.display = 'block';
};

// Close modals when clicking on <span> (x)
closeButtons.forEach(closeButton => {
    closeButton.onclick = function() {
        addStreakModal.style.display = 'none';
        calendarModal.style.display = 'none';
    };
});

// Close modals when clicking outside of the modal content
window.onclick = function(event) {
    if (event.target === addStreakModal) {
        addStreakModal.style.display = 'none';
    }
    if (event.target === calendarModal) {
        calendarModal.style.display = 'none';
    }
};

// Open the second modal when a substance is selected
substanceButtons.forEach(button => {
    button.onclick = function() {
        addStreakModal.style.display = 'none';
        calendarModal.style.display = 'block';
    };
});

// Handle the save date button
const saveDateButton = document.getElementById('save-date-button');
saveDateButton.onclick = function() {
    const startDate = document.getElementById('start-date-picker').value;
    if (startDate) {
        alert(`Start date selected: ${startDate}`);
        calendarModal.style.display = 'none';
        // You can add your logic here to handle the selected start date
    } else {
        alert('Please select a start date.');
    }
};

window.onload = function (){
    fetch('/get-username')
        .then(response => response.json())
        .then(data => {
            if (data.username) {
                document.querySelector('#username').textContent = "@"+data.username;
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