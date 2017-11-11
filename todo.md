# To Do List for Sinatra Final Project
[X] Set up database tables
[X] Create models & AR associations
[X] Add country name/location to the experiences table
[X] Create controllers for each model
    -user_controller
    -category_controller
    -experience_controller
[X] Set up view folder structure
    -index.erb
    -user (login, signup)
    -experience (show, create, edit, experiences <-all)
    -categories (show)
[X] Create main page for login & signup
[X] Create sign-up page
[X] Create login page
[X] Create CRUD and forms pages
[X] Change the way we create/edit forms with the new country class
[X] Add countries back in to the descriptions
[X] Options for creating new based on others' experiences
[X] Change name of project to Adventure bucket list
[X] Putting helper methods in helpers section
[X] Test user authentication
[X] Add numbers next to country & categories links
[X] Refactor code (credit/edit countries code, logged-in, current user, checking if empty)
[X] Styling for pages
[X] Record coding session
[X] Record session using the app
[X] Write blog
[X] Submit project

USER authentication
-When a user is logged out-
[X] They should be able to see the /, login page, and signup page
[X] They should not be able to see any other routes
[X] They should not see the logout link

-When a user is logged in-
[X] They should not be able to see the /, login page, or signup page
[X] They should see the logout link
[X] They should be able to see the experiences page, create new page, countries page, and categories page
[X] They should be able to see the show pages
[X] They should be able to see the edit button and pages for their experiences only
[X] They should be able to see the delete button for their experiences only
[X] They should not be able to see the edit button, edit page or delete button for experiences that are not theirs

# Testing
## Main Page '/'
[X] When logged out, the page should show
[X] The page should have two buttons to login and signup
[X] The login button should take you to the login page
[X] The signup button should take you to the signup page
[X] When logged in, the page should redirect you to '/experiences'
[X] The page should be styled
[X] When logged out, the logout button should not be visible

## Users
### Signup '/signup'
[X] When logged out, the page should show
[X] Getting to the page by typing in the URL bar is successful
[X] Name, Email and Password fields should be fillable
[X] The password field should hide the characters
[X] Leaving the name blank redirects the page back to the signup page
[X] Leaving the email blank redirects the page back to the signup page
[X] Leaving the password blank redirects the page back to the signup page
[X] Entering an email already in the system redirects the page back to the signup page with a linked message to the login page
[X] Completing the form with new information, then clicking "Create my Account" brings the account to the '/experiences' page with the correct user's name listed
[X] The page is styled
[X] The flash messages are styled
[X] When logged in, the page redirects to '/experiences'
[X] When logged out, the logout button should not be visible
[X] The form should indicate which fields are required
[X] The signup page should have a button to the login page


### Login '/login'
[X] When logged out, the page should show
[X] Getting to the page by typing in the URL bar is successful
[X] Email and Password fields should be fillable
[X] The password field should hide the characters
[X] Leaving the email blank redirects the page back to the login pages
[X] Leaving the password blank redirects the page back to the login page
[X] Entering an email not in the system redirects the page back to the login page witih a linked message to the signup page
[X] Entering an incorrect password redirects the page back to the login page with a message
[X] Completing the form with correct login information, then clicking "Login" brings the account to the '/experiences' page with the correct user's name listed
[X] The page is styled
[X] The flash messages are styled
[X] When logged in, the page redirects to '/experiences'
[X] When logged out, the logout button should not be visible
[X] The form should indicate which fields are required
[X] The login page should have a button to the signup page

## Experiences
[X] when logged out, this page should not be accessible - redirects to login page
[X] The page should list the correct user in the H1
[X] The logout button should be visible
[X] All experiences that the user created should be listed along with the country
[X] An experiene should be linked, and when clicked, taken to the correct experience
[X] The 'Add New Experience' button takes the user to 'experiences/new'
[X] The 'View by Country' button takes the user to '/countries'
[X] The 'View by Category' button takes the user to '/categories'
[X] There is a section to get inspiration from others
[X] When a user has no experiences, the add new button should be more prominent
[X] There should not be any other user's experiences on your personal list
[X] The page should be styled

## Experiences by User
[X] The inspiration from others section should have linked experiences, when clicked, take you to the other user's experience page
[X] There should not be any experiences from your personal list on the "Get Inspriation from Others" liste
[X] The 'View all by Country' should redirect to a page that shows all experiences by Country
[X] The 'View all by Category' should redirect to a page that shows all experiences by Category
[X] The page should be styled

### Experiences Show Page '/experiences/:id' - your experience
[X] When logged out, this page should not be accessible - redirects to the login page
[X] Getting to the page by typing in the URL is successful
[X] The logout button should be visible
[X] The description, country and categories should be listed on the page
[X] The page should list that it is from your adventure bucket list
[X] Two buttons - Edit Experience and Delete this Experience
[X] Edit Experience should take you to the edit page
[X] Delete Experience should delete the experience and return you to the '/experiences' list where the experience will not be listed
[X] Back to experiences list is a link that redirects you to '/experiences'
[X] The page should be styled
[X] Country and category should be linked to their show page

### Experiences Show Page '/experiences/:id' - another user's experiences
[X] When logged out, this page should not be accessible - redirects to the login page
[X] Getting to the page by typing in the URL is successful
[X] The logout button should be visible
[X] The description, country and categories should be listed on the page
[X] The page should list that it is from another user's adventure bucket list
[X] One button - Add this to my list
[X] Add this to my list should redirect to a new experience form
[X] Back to experiences list is a link that redirects you to '/experiences'
[X] The page should be styled


### Experiences Edit Page '/experiences/:id/edit'
[X] When logged out, this page should not be accessible - redirects to the login page
[X] The logout buttons should be visible
[X] If the experiences belongs to another user, and the URL is typed in, it should redirect you to the experience show page with a flash message
[X] The description, country and categories should auto-fill with the current info
[X] Change the description, then click "Save Your Changes"
---> The description should be changed on the show page and the '/experiences' pages
[X] Change the country to a country already in the system, then click "Save Your Changes"
---> The country should be changed on the show page and the '/experiences' pages
---> The experience will be listed under the correct country in '/countries'
[X] Change the country to a country not yet in the system, then click "Save Your Changes"
---> The country should be changed on the show page and the '/experiences' page
---> In the '/countries' section, the new country will have been added and the experience will be under that country
[X] Change the category to a category already in the system, then click "Save Your Changes"
---> The category should be changed on the show page
---> In the '/categories' section, the experience will be listed under the correct category and removed from the old category
[X] Add a new category to the experience from the list of categories in the system, then click "Save Your Changes"
---> The category should be added on the show page
---> In the '/categories' section, the experience will be listed under the new category and the old category
[X] Remove associations with all already-created categories and create a new category Name
---> The category should be changed on the show page
---> In the '/categories' section, there will be a new category and the experience will be listed under the new category
[X] Add a new category from the already-created list, and also create a new category
---> The categories should be changed on the show page
---> In the '/categories' section, there will be a new category and the experience will be listed under the new category, and it will also be under the already-created category
[X] Leave the description blank - the page should redirect you back to the '/edit' page
[X] Leave the country blank - the page should redirect you back to the '/edit' page
[X] Leave categories blank - the experience should save and the categories section on the show page will be blank
[X] Leaving the categories blank does not create a new empty category
[X] The page should be styled
[X] Flash messages should be styled
[X] The form should indicate which fields are required

### Experiences Add New Page '/experiences/new'
[X] When logged out, this page should not be accessible - redirects to the login page
[X] The logout button should be visible
[X] Leave the description blank - the page should redirect you back to the '/new' page
[X] Leave the country blank - the page should redirect you back to the '/new' page
[X] Leave categories blank - the experience should save and the categories section on the show page will be blank
[X] Leaving the categories blank does not create a new empty category
[X] Add a description and country that is already in the system, then click "Add Your New Experience"
---> The experience should be added/redirect to the show page and the '/experiences' pages
---> The experience will be listed under the correct country in '/countries'
[X] Add new, add description and a country that is not in the system, then click "Add Your New Experience"
---> Redirected to the new show page and the experience added to '/experiences' page
---> In the '/countries' section, the new country will have been added and the experience will be under that country
[X] Add a category that is already in the system, then click "Add Your New Experience"
---> The category should be listed on the show page
---> In the '/categories' section, the experience will be listed under the correct category
[X] Create a new category Name
---> The category should be listed on the show page
---> In the '/categories' section, there will be a new category and the experience will be listed under the new category
[X] Add a new category from the already-created list, and also create a new category
---> The categories should be listed on the show page
---> In the '/categories' section, there will be a new category and the experience will be listed under the new category, and it will also be under the already-created category
[X] The page should be styled
[X] Flash messages should be styled
[X] The form should indicate which fields are required

### Experiences Add New From User '/experiences/:id/new_from_user'
[X] When logged out, this page should not be accessible - redirects to the login page
[X] The logout button should be visible
[X] '/new_from_user' route should only work on ids that do not belong to the current user
[X] The description, country and categories should auto-fill with the current info
[X] Save everything as is
---> The page should redirect to the show page where it indicates that the experience belongs to you
---> The experience will show on '/experiences' in your list
[X] Change the description, then click "Add Your New Experience"
---> The description should be changed on the show page and the '/experiences' page in your user's list
[X] Change the country to a country already in the system, then click "Add Your New Experience"
---> The country should be listed on the show page and the '/experiences' pages
---> The experience will be listed under the correct country in '/countries'
[X] Change the country to a country not yet in the system, then click "Add Your New Experience"
---> The country should be listed on the show page and the '/experiences' page
---> In the '/countries' section, the new country will have been added and the experience will be under that country
[X] Change the category to a category already in the system, then click "Add Your New Experience"
---> The category should be listed on the show page
---> In the '/categories' section, the experience will be listed under the correct category, but the experience from the other user should be listed in the old category
[X] Add a new category to the experience from the list of categories in the system, then click "Save Your Changes"
---> The category should be listed on the show page
---> In the '/categories' section, the experience will be listed under the new category and the old category
[X] Remove associations with all already-created categories and create a new category Name
---> The category should be listed on the show page
---> In the '/categories' section, there will be a new category and the experience will be listed under the new category, and it will also be under the old category from the previous user
[X] Add a new category from the already-created list, and also create a new category
---> The categories should be listed on the show page
---> In the '/categories' section, there will be a new category and the experience will be listed under the new category, and it will also be under the already-created category and the category from the old user
[X] Leave the description blank - the page should redirect you back to the '/new_from_user' page
[X] Leave the country blank - the page should redirect you back to the '/new_from_user' page
[X] Leave categories blank - the experience should save and the categories section on the show page will be blank
[X] Leaving the categories blank does not create a new empty category
[X] The page should be styled
[X] Flash messages should be styled
[X] The form should indicate which fields are required

## Countries - View All
[X] When logged out, the page should redirect to the login page
[X] The page should list all countries in the system that have experiences associated with them
[X] A country in the system with 0 experiences should not show
[X] The number of experiences should be listed next to the country name
[X] The country name is clickable and redirects to the country's show page
[X] The page is styled
[X] The logout button is visible

## Countries - Show page
[X] When logged out, the page should redirect to the login page
[X] The page should list all experiences from the user, and then all experiences from others
[X] The experiences should be linked and the link redirects you to the experiences' show page
[X] The logout button is visible
[X] The page is styled

## Categories - View All
[X] When logged out, the page should redirect to the login page
[X] The page should list all categories in the system that have experiences associated with them
[X] A category in the system with 0 experiences should not show
[X] The number of experiences should be listed next to the category name
[X] The category name is clickable and redirects to the category's show page
[X] The page is styled
[X] The logout button is visible

## Categories - Show page
[X] When logged out, the page should redirect to the login page
[X] The page should list all experiences from the user, and then all experiences from others
[X] The experiences should be linked and the link redirects you to the experiences' show page
[X] The logout button is visible
[X] The page is styled

[X] Drop region column from Countries
[X] Alphabetize .all lists
