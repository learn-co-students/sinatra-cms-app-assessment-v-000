# Sinatra Content Management System App

## Overview

- [What to Expect from the Project Review](#expectations)
- [Project Requirements](#requirements)
- [Instructions](#instructions)
- [Support](#support)
- [Practicing for Success on Learn](#success)
- [Resources](#resources)

For this assessment you'll be creating a [CRUD], [MVC] app using Sinatra.  This app should be a custom app that is created to track something important to you, whether that's your golf club collection, video games, or travel destinations.  Essentially, you're building a simple Content Management System ([CMS]) using the tools you've learned thus far.

## <a id="expectations">What to expect from the Project Review</a>

Project reviews are focused on preparing you for [technical interviews](https://www.brightnetwork.co.uk/career-path-guides/technology-it-software-development/five-ways-stand-out-your-technology/what-expect-technical-interview/). Treat project reviews as if they were technical interviews, in both attitude and technical presentation.

During your project review, be prepared to:

1. Go through your app and show us how it meets the requirements. 5-10 mins.
2. Explain your code from execution point to exit point. We're making sure you wrote it and understand how it works. 10-15 mins.
3. Live code.  This could mean refactoring or adding a feature as an exercise to make sure you're comfortable working with your code. 10-15 mins.

Project reviews are focused on preparing you for technical interviews. Treat project reviews as if they were technical interviews, in both attitude and presentation.

If any requirements are missing or if significant gaps in understanding are found, be prepared to do any or all of the following:

- Extend the application with a new feature, more data, a different domain etc.
- Submit an improved version
- Meet again for another project review

What won't happen:

- You won't be yelled at, belittled, or scolded
- You won't be put on the spot without support
- There's nothing you can do to instantly fail or blow it

## <a id="requirements">Project Requirements</a>

1. Build an [MVC] Sinatra Application.
2. Use [ActiveRecord] with Sinatra.
3. Use Multiple Models.
4. Use at least one `has_many` relationship on a User model and one `belongs_to` relationship on another model
5. Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
6. Must have the ability to create, read, update and destroy any instance of the resource that belongs to a user.
7. Ensure that any instance of the resource that belongs to a user can be edited or deleted only by that user.
8. You should also have validations for user input to ensure that bad data isn't added to the database. The fields in your signup form should be required and the user attribute that is used to login a user should be a unique value in the DB before creating the user.



## <a id="instructions">Instructions</a>

1. Watch this

2. Build your application.

3. Documentation

4. Submission
    - [Submit this checklist](https://docs.google.com/forms/d/1ItDHkNbtHJP8T2G28Nqc3Ad8MppbPDpqv9AijAOCFDA/) after confirming all requirements are met.
    - Prepare a video demo (narration helps!) describing how a user would interact with your working gem. Some common video recording tools used are [Zoom](https://zoom.us/), [Quicktime](https://www.apple.com/quicktime/download/), and [Nimbus](https://chrome.google.com/webstore/detail/nimbus-screenshot-screen/bpconcjcammlapcogcnnelfmaeghhagj?hl=en). After you create your demo, publish it on a service like [YouTube](https://www.youtube.com/) or [Google Drive](https://www.google.com/drive/).
    - Write a blog post about the project and process.
    - On Learn, submit links to the GitHub repository for your app, your video demo (not your 30-minute coding session), and your blog post each to the corresponding textbox in the right rail, and hit "I'm done" to wrap it up.  

## <a id="support">Helpful Hints:</a>

* For project support, you can reach out to [your Section Lead](http://help.learn.co/instructional-support/receiving-course-support/who-are-the-section-leads) responsible for this section and/or schedule up to four 30-minute [Project Support sessions](https://theflatironschool.typeform.com/to/B9BrgH).
* After project submission, watch for an email from Learn with instructions to schedule an assessment. If you don't receive the email within a day or so, reach out to [your Section Lead](http://help.learn.co/instructional-support/receiving-course-support/who-are-the-section-leads).

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

- [Bundler](https://bundler.io/v1.12/guides/creating_gem.html)
- [Git Repository Basics](https://learn.co/tracks/full-stack-web-development-v5/git-and-github/git/git-repository-basics)
- [Environments, Requiring Files, Bundler, and Gems](https://www.youtube.com/watch?v=XBgZLm-sdl8)
- [Video- CLI Data Gem Walkthrough](https://www.youtube.com/watch?v=_lDExWIhYKI)
- [Video- CLI Data Gem Walkthrough: Creating a CLI Scraper Gem](https://www.youtube.com/watch?v=Y5X6NRQi0bU)
- [Video- Common Anti-Patterns in CLI Data Gem](https://www.youtube.com/watch?v=cbMa87oWv08)
- [Video- Student Example 1: Refactoring CLI Data Gem](https://www.youtube.com/watch?v=JEL_PXr74qQ)
- [Video- Student Example 2: Refactoring CLI Data Gem](https://www.youtube.com/watch?v=Lt0oyHiKWIw)
- [How to build a ruby gem](http://guides.rubygems.org/make-your-own-gem/)
- [How to publish your gem](http://guides.rubygems.org/publishing/)


<p class='util--hide'>View <a href='https://learn.co/lessons/cli-data-gem-assessment'>CLI Data Gem Project</a> on Learn.co and start learning to code for free.</p>
[CRUD]: https://learn.co/tracks/full-stack-web-development-v6/orms-and-activerecord/activerecord/activerecord-crud-lab
[CMS]: http://www.businessdictionary.com/definition/content-management-system-CMS.html
[MVC]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/mvc-and-forms/intro-to-mvc
[section lead]: http://help.learn.co/instructional-support/receiving-course-support/who-are-the-section-leads
[Golf Club Organizer]: https://github.com/learn-co-curriculum/example-sinatra-assessment
[Todo List]: http://todomvc.com
[Fill out this checklist.]: https://docs.google.com/forms/d/e/1FAIpQLSdIrS7g6y_B4dAY7HGS4yAndg9bfHuw7GmsiwA6MQXXqNrDjA/viewform?entry.237262577&entry.835010005&entry.301147721
