# Sinatra One Page App Project

## Overview

For this assessment you're going to build a Sinatra Application that can answer a simple question for a user using no more than 1 or 2 views. The answer to the question must come from a local ActiveRecord domain. You can seed the domain with data from a local task that can use an external source of data for the initial data dump. The root of the site should provide the user with a form to fill in and upon submission, the application should render a view that answers the user's submission with data from the database.

## Requirements

1. Build an MVC Sinatra Application.
2. Use ActiveRecord with Sinatra.
3. Create a class that can query an external data source and persist that data locally through ActiveRecord.
4. Use db/seeds.rb to pre-seed the database using your external data class.
5. Build a form that submits to a Sinatra controller action.
6. Use the form submission data to query ActiveRecord.
7. Render ActiveRecord instances in a view.
8. Deploy your application to Heroku.

### Example Domains

- [What Should I Watch]() - Enter a zipcode and see what movies are playing near you. [Source](https://github.com/learn-co-curriculum/what-should-i-watch-sinatra) **This is the prefered example application to model your application after**
- What Should I Listen To - Enter a genre and return the top 10 tracks of that genre.
- [Octomaps](http://octomaps.com/) - Enter a repository from GitHub and see where the the contributors to that repository live (this example application uses Javascript and some other technologies you don't need to use however it is a similar example). [Source on GitHub](https://github.com/JohnKellyFerguson/octomaps)
- Baby Name Picker - Use a list of popular baby names and have the user enter their last name and send back a random name from your database.

If you are unsure about a domain or can't come up with an idea, feel free to reach out to support@learn.co for some advice.

## Instructions

1. Create a new repository on GitHub for your Sinatra Application, ie: `what-should-i-watch-sinatra`.
2. On Learn, use the textbox in the right rail to submit the URL of your repo.
3. Build your application. Make sure to commit early and commit often.
4. While you're working on it, record a 30 min coding session with your favorite screen capture tool. During the session, either think out loud or not. It's up to you. You don't need to submit the video, but we may ask for it at a later time.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working application.
6. Write a blog post about the project and process.
7. When done, e-mail both your video demo and link to your blog post to assessments@learn.co and hit "I'm done" in the right rail to wrap it up.
8. We'll reach out to you soon to schedule a pairing process. If you don't hear from us in 48 hours after submission, get in touch!

### Be Prepared to:

1. Explain your code from execution point to exit point. We're making sure you wrote it and understand how it works, nothing else. 5-10 minutes
2. Write tests together. You'll be responsible for making tests pass, not writing test code. However, you'll be expected to provide expected return data of methods. You'll need to know how your code should work, not rspec or testing. 20-30 minutes
3. Refactor code. 20-30 minutes
4. Extend the application with a new feature, more data, a different domain etc. 20-30 minutes
5. Submit an improved version.
6. Write a README.md.

### What to expect from the pairing session

- Use the best vocabulary you can. Technical terms allow for you to be more precise which makes conversations about code much easier.
- If you make a mistake, correct yourself! We all make mistakes, I promise.
- Trust yourself
- Trust us
- Think on your feet. Feel free to look things up while you're pairing with us. You'll be asked to expand on concepts you implemented and you will be pushed to the edge of your knowledge.
- Explain the details. We're curious!
- You're going to learn a ton. We will give pointers and show you ways to improve your code. This isn't telling you that your code is wrong, it's simply us teaching. Whatever you don't quite understand will be explained

### What won't happen:

- You won't be told you're ever wrong
- You won't be yelled at, belittled, or scolded
- You won't be put on the spot without support
- There's nothing you can do to instantly fail or blow it.

## Resources

 - [Deploying Rack Apps to Heroku](https://devcenter.heroku.com/articles/rack)
 - [Get Started with Sinatra on Heroku](http://www.sitepoint.com/get-started-with-sinatra-on-heroku/)
