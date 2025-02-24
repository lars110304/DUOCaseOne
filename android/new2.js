const express = require('express');
const app = express();

// ... database connection

app.post('/swipe', async (req, res) => {
  const { userId, swipedUserId, direction } = req.body;

  // Store the swipe in the database
  // ...

  if (direction === 'right') {
    // Check if the swiped user has also swiped right on the current user
    const isMatch = await checkMatch(userId, swipedUserId);
    if (isMatch) {
      // Create a match
      // ...
      // Notify both users
      // ...
    }
  }

  res.send({ success: true });
});

// ... other API endpoints

app.listen(3000, () => console.log('Server running'));