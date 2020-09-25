#### GitHub Source 

https://github.com/KeiranHoward/Hangman



# Software Development Plan



### **Describe** at a high level what the application will do

---

The software I am designing is a game of hangman. The application will ask the user for input information such as a username as well as a selection of word themes. Once the user has selected the game word theme, the application will then randomly import a word from an external list and seporate the word into inidiviual letters. If the user guesses a letter correctly the letter will then be displayed on the screen. If the user guesses a letter incorrectly the application will add 1 to user attempts, print a section of a hangman ascii image and print the incorrectly guess letter. If the user guesses all letters correctly the application will print "You Won!" and then ask if they would like to play again. If the user selects "yes" the application will run again, if they select "no" the application will exit. Alternativly if the user runs out of attempts the words "You Loss" will print along with the hidden word. They will then be presented with the play again option. 



### **Identify** the problem it will solve and **explain** why you are developing it

---

The application will the widespread problem of bordem whilst still being educational. I am developing this program as I belive it will be a fun project to test my newly learnt skills using the Ruby progamming language. There are aspects of this application which will require me to research technologies which have not been covered in class. I believe this project will be a challenge at times but will solidify my current knowlegde in programming.



### **Identify** the target audience

---

This application is mostly targeted towards high school students as some words may be too complex for a younger audience to spell. The word theme select feature will also allow users to pick a topic which they are interested in hopefully making the game more enjoyable. 



### Explain how a member of the target audience will use it

----

...







### Describe three features 

---

Word Theme Selection:

The application will have 5 seporate ruby files each containing an array of strings representing a common theme. The user will be given a option upon a new game whereas they can select which theme or wordlist the word will be randomly selected from.

Save Game:

The application will have an option which will save the current instance of your game and store it in a seporate file. This can then be called using an option. The saved file data will be stored using a Ruby gem which will allow for a save and load function. 

Ascii hangman:

When the user makes an incorrect letter attempt a component of a hang man image will be printed to the screen. Each time a wrong letter is added the hangman parts will be added incrementally. 

### Flow Control Diagram

---

