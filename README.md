# Sinatra Content Management System App

## Overview

- [What to Expect from the Project Review](#expectations)
- [Project Requirements](#requirements)
- [Instructions](#instructions)
- [Practicing for Success on Learn](#success)
- [Resources](#resources)

For this assessment you'll be creating a [CRUD], [MVC] app using Sinatra.  This app should be a custom app that is created to track something important to you, whether that's your golf club collection, video games, or travel destinations.  Essentially, you're building a simple Content Management System ([CMS]) using the tools you've learned thus far.

## <a id="expectations">What to expect from the Project Review</a>

Project reviews are focused on preparing you for [technical interviews]. Treat project reviews as if they were technical interviews, in both attitude and technical presentation.

During your project review, be prepared to:

1. Go through your app and show us how it meets the requirements. ~10-15 min.
2. Explain your code from execution point to exit point. We're making sure you wrote it and understand how it works. ~10-15 min.
3. Live code.  This could mean refactoring or adding a feature as an exercise to make sure you're comfortable working with your code. ~10-15 min.

If any requirements are missing or if significant gaps in understanding are found, be prepared to do any or all of the following:

- Extend the application with a new feature, more data, a different domain etc.
- Submit an improved version
- Meet again for another project review

What won't happen:

- You won't be yelled at, belittled, or scolded
- You won't be put on the spot without support
- There's nothing you can do to instantly fail or blow it

## <a id="requirements">Project Requirements</a>

1. Build an [MVC] Sinatra application.
2. Use [ActiveRecord] with Sinatra.
3. Use multiple models.
4. Use at least one `has_many` relationship on a User model and one `belongs_to` relationship on another model.
5. Must have user accounts - users must be able to sign up, sign in, and sign out.
6. Validate uniqueness of user login attribute (username or email).
7. Once logged in, a user must have the ability to create, read, update and destroy the resource that `belongs_to` user.
8. Ensure that users can edit and delete only their own resources - not resources created by other users.
9. Validate user input so bad data cannot be persisted to the database.
10. BONUS: Display validation failures to user with error [messages]. (_This is an optional feature, challenge yourself and give it a shot!_)

## <a id="instructions">Instructions</a>

1. Create a new repository on GitHub for your Sinatra application.
2. When you create the Sinatra app for your assessment, add the [spec.md] file from this repo to the root directory of the project, commit it to Git and push it up to GitHub.
3. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
4. While you're working on it, record a 30 min coding session with your favorite screen capture tool. During the session, either think out loud or not. It's up to you. You don't need to submit the video, but we may ask for it at a later time.
5. Make sure to create a good README.md with a short description, install instructions, a contributor's guide, and a link to the [license] for your code.
6. Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement *before* you submit your project.
7. Prepare a short video demo with narration describing how a user would interact with your working application.
8. Write a blog post about the project and process.
9. When done, submit your GitHub repo's URL, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up.

You may not use a blog application or Twitter clone for your project, as we have used these as examples in the curriculum.

## <a id="success">Practicing for Success on Learn</a>

#### Be scrappy.
- If you make a mistake, correct yourself! We all make mistakes, I promise.
- Think on your feet. Feel free to look things up while you're pairing with us. You'll be asked to expand on concepts you implemented and you will be pushed to the edge of your knowledge.
- Explain the details. We're curious!
- Don’t worry if your code isn’t perfect the first time - focus on getting something working, then refactoring to improve it.

#### Make no little plans.
- You're going to learn a ton. We will give pointers and show you ways to improve your code. This isn't telling you that your code is wrong, it's simply us teaching. Whatever you don't quite understand will be explained.
- Be proud of your project and your code, and show confidence in it.

#### Radiate positivity.
- Present yourself and your project in the best way possible.
- Be open to feedback, both positive and constructive.
- Remember, the interviewer is a person too. Be nice to them!

#### Work Together.
- Trust yourself.
- Trust us - our goal is to help you be successful in achieving your goals.
- We understand that this process can be stressful. We’re here to help you through.

#### Pursue mastery.
- Use the best technical vocabulary you can. We’ll help you with the words you can’t remember, or if you’re unsure about how something is pronounced.
- Ask questions! Curiosity and willingness to learn are hugely valued in our industry. If you haven’t heard of something, that’s okay - use this opportunity to learn about it!

## <a id="resources">Resources</a>

[Example Domain - Golf Club Organizer]<br>
[RESTful Routing]<br>
[Securing Passwords in Sinatra]<br>
[Mechanics of Sessions]<br>
[Video: Sinatra app from scratch]<br>

[CRUD]: https://learn.co/tracks/full-stack-web-development-v6/orms-and-activerecord/activerecord/activerecord-crud-lab
[CMS]: http://www.businessdictionary.com/definition/content-management-system-CMS.html
[technical interviews]: https://www.brightnetwork.co.uk/career-path-guides/technology-it-software-development/five-ways-stand-out-your-technology/what-expect-technical-interview/
[MVC]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/mvc-and-forms/intro-to-mvc
[section lead]: http://help.learn.co/instructional-support/receiving-course-support/who-are-the-section-leads
[Golf Club Organizer]: https://github.com/learn-co-curriculum/example-sinatra-assessment
[Todo List]: http://todomvc.com
[Fill out this checklist.]: https://docs.google.com/forms/d/e/1FAIpQLSdIrS7g6y_B4dAY7HGS4yAndg9bfHuw7GmsiwA6MQXXqNrDjA/viewform?entry.237262577&entry.835010005&entry.301147721
[ActiveRecord]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/activerecord/activerecord-setup-in-sinatra
[slack]: https://learn-co.slack.com
[section lead]: http://help.learn.co/instructional-support/receiving-course-support/who-are-the-section-leads
[messages]: https://github.com/SFEley/sinatra-flash
[spec.md]: https://github.com/learn-co-students/sinatra-cms-app-assessment-v-000/blob/master/spec.md
[license]: https://opensource.org/licenses/MIT
[study groups]: https://learn.co/study-groups
[project support sessions]: https://theflatironschool.typeform.com/to/B9BrgH
[Example Domain - Golf Club Organizer]: https://github.com/learn-co-curriculum/example-sinatra-assessment
[RESTful Routing]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/activerecord/sinatra-restful-routes
[Securing Passwords in Sinatra]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/activerecord/securing-passwords-in-sinatra
[Mechanics of Sessions]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/sessions/mechanics-of-sessions
[Video: Sinatra app from scratch]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/activerecord/video-review-authentication
