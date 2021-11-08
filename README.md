# Song Search



The purpose of the app is to allow a user to search for songs in the itunes library. I implemented a UISearcbar that updates the results as a user types. Once a user selects a song from the TableView, the user is taken to the Detail screen with a larger album image and track information. 

My focus on this project was using a MVVM pattern. A common pattern in my current field (React Native) is to have as many 'dumb' components/views as possible while placing the logic into other modules.  In addition to making our modules smaller, it also makes them reusable, scalable and easy to test. My intention was to accomplish some version of that here.

*There are a few ways that I would have liked to improve this project:

*A more generic networking stack , with better error handling.

*Conditional styling for Cells with varying content - Some results don't have a Collection title, Song title, or Collection Image.

*The images don't load right away when a user begins searching.

*More styled UI elements for the detail page -  I would have liked to include player controls and an option to preview the tracks.

*User friendly messaging if the search results are empty or nil.
