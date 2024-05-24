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