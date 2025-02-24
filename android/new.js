import React, { useState } from 'react';

function Card({ user, onSwipe }) {
  const handleSwipe = (direction) => {
    onSwipe(user.id, direction);
  };

  return (
    <div className="card">
      <img src={user.profilePicture} alt={user.name} />
      <h3>{user.name}</h3>
      <button onClick={() => handleSwipe('left')}>Dislike</button>
      <button onClick={() => handleSwipe('right')}>Like</button>
    </div>
  );
}

function App() {
  const [users, setUsers] = useState([
    // ... your user data
  ]);

  const handleSwipe = (userId, direction) => {
    // Send swipe data to the backend
    console.log(`User ${userId} swiped ${direction}`);
    // Update the list of users
    setUsers(users.filter((user) => user.id !== userId));
  };

  return (
    <div className="app">
      {users.map((user) => (
        <Card key={user.id} user={user} onSwipe={handleSwipe} />
      ))}
    </div>
  );
}

export default App;