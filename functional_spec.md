# Playlist CLI App
The Playlist CLI application provides users the ability to create and maintain a playlist of songs from their terminal through a series of command line prompts and responses.

## User Stories

### Basic Operations
- As a user, I want to add a song to a playlist so that I may keep a record of it.
- As a user, I want to delete a song from my playlist so that I may remove a previously-stored record of it.
- As a user, I want to view the songs I've added to the list so that I may gather previously-stored records.


### Continuous Operations
- As a user, I want to perform multiple actions without restarting the application so that I can use the playlist effectively.


### Functional Requirements
- The interface must prompt the user for an action (view, add, delete, quit)
- The interface must prompt the user to provide song information for the requested action (a title, song, and/or prompt).
- The interface must display a message to the user about the result of their action.
- The interface must handle invalid input gracefully (e.g., empty strings)
- The interface must allow the user to perform another action after one completes.