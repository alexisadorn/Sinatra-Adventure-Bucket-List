# Specifications for the Sinatra Assessment

Specs:
- [x] ~~Use Sinatra to build the app~~ - Sinatra gem has been installed and required in the project
- [x] ~~Use ActiveRecord for storing information in a database~~ - ActiveRecord is being using to store instances of
        the model classes in the database by connecting these models to `ActiveRecord::Base`
- [x] ~~Include more than one model class~~ - User, Experience, Country, Category and two classes for joins tables
        CountryCategory and ExperienceCategory
- [x] ~~Include at least one has_many relationship~~ - a User has many Experiences, an Experience has many Categories,  a
        Country has many Experiences, and a Category has many Users
- [x] ~~Include user accounts~~ - Users can successfully sign up for an account and login to their account
- [x] ~~Ensure that users can't modify content created by other users~~ - Using sessions, the user's ID is maintained and
        any content created by someone with a different user ID is not editable/removable
- [x] ~~Include user input validations~~ - By requiring input fields and providing an `is_empty?` helper method as a backup,
        creating or editing a new experience with missing data is not successful
- [x] ~~Display validation failures to user with error message (example form URL e.g. /posts/new)~~ - Flash messages are used
        in this app to indicate to the user when they are missing a required field or if they are trying to access a page they should not have access to
- [x] ~~Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code~~ The README page can be found at https://github.com/alexisadorn/Sinatra-Adventure-Bucket-List/blob/master/README.md

Confirm
- [x] ~~You have a large number of small Git commits~~ There are currently 50 commits
- [x] ~~Your commit messages are meaningful~~ Each commit message clearly indicates the section of the app that was modified
- [x] ~~You made the changes in a commit that relate to the commit message~~ Commit messages indicate changes that were made
- [x] ~~You don't include changes in a commit that aren't related to the commit message~~
