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
    } else {
        alert('Please select a start date.');
    }
};

// Function to fetch streaks data
function fetchStreaksData() {
    fetch('/streaks-data')
        .then(response => response.json())
        .then(data => {
            const streaksContainer = document.getElementById('streaks-container');
            streaksContainer.innerHTML = '';
            data.forEach(streak => {
                // Create streak element
                const streakElement = document.createElement('div');
                streakElement.classList.add('streak');
                // Create streak content
                const streakContent = `
          <div class="head">
            <div class="info">
              <h3><b>${streak.name}</b></h3>
              <small>Starting Date: ${formatDate(streak.start_date)}</small>
            </div>
          </div>
          <h3><b>Your current Record:</b> ${calculateDuration(streak.start_date)}</h3>
        `;
                streakElement.innerHTML = streakContent;
                // Append streak element to container
                streaksContainer.appendChild(streakElement);
            });
        })
        .catch(error => console.error('Error:', error));
}

// Function to calculate duration based on start date
function calculateDuration(startDate) {
    const startDateTime = new Date(startDate).getTime();
    const currentDateTime = new Date().getTime();
    const timeDifference = currentDateTime - startDateTime;

    // Convert time difference to days, hours, minutes
    const days = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
    const hours = Math.floor((timeDifference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));

    return `${days} days ${hours} hours ${minutes} minutes`;
}

// Function to format date
function formatDate(date) {
    return new Date(date).toLocaleDateString(undefined, {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
    });
}

// Call fetchStreaksData function when the page loads
window.onload = function() {
    fetch('/get-username')
        .then(response => response.json())
        .then(data => {
            if (data.username) {
                document.querySelector('#username').textContent = "@" + data.username;
                document.querySelectorAll('.profile-photo').forEach(element => element.setAttribute('src', data.profile_picture));
            }
        })
        .catch(error => console.error('Error:', error));

    fetch('/get-role')
        .then(response => response.json())
        .then(data => {
            if (data.role_id !== 2) {
                document.querySelector('#adminLink').style.display = 'none';
            }
        })
        .catch(error => console.error('Error:', error));

    fetchStreaksData(); // Call the function to fetch streaks data
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