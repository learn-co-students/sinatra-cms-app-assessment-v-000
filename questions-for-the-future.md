## This file contains some thoughts for going forward - feel free to read through and let me know your feedback!

### The goal to be kept in mind:  get students to schedule an assessment!  Specifically, students should be able to start, work through, and complete their projects with a clear set of requirements and all the tools they need.


#### 1.  Displaying validation errors

The question: Do we want to include the requirement to include showing data validation error messages?  Previously, this requirement was listed in the `spec.md` file but not the README.  I have added it to the README.

The problem:  Sinatra Playlister is the only lab that includes flash messages, and it uses the `rack-flash3` gem, which often gives students a hard time (seems to be a bug or dependency discrepancy?).  

My take:

  - `sinatra-flash` is better, in this author's opinion, but there's no example use case in the curriculum.  
  - Students haven't been exposed to ActiveRecord validations or errors at this point enough to use them effectively to display validation errors.  
  - The example project uses the pattern of passing a local variable from a controller to a view, also not something focused on in the curriculum.

  IMHO: I like the requirement.  I think it's a good step in the right direction toward a useful feature.  I actually kind of like the vagueness of the implementation possibilities, it's something the students should benefit from trying.

  My solution: I would recommend updating Sinatra Playlister to use `sinatra-flash` and adding flash messages to the example project (or replacing it with a new one)

#### 2.  Getting Started

The question: How much help should we provide for students getting started with their Sinatra project, and how opinionated should we be?

The problem: Lots of students seem to get hung up getting started with their project.

My take:

  - As a section lead, I've answered this question so many times, along with several others, that I've got answers prepared and kept in an [faq repo].  Is this something worth sharing?  Adding to the curriculum?  Adding as a linked resource?  If we do standardize and add it, is it curriculum or something for help.learn.co?
  - I recommend the Corneal gem to students.  Is this something we should add to the curriculum?  Or keep as an 'extra' resource?  Should we demand students build from scratch?

IMHO:

 - Not sure where this belongs, looking for feedback here.  If this content is worth making available to students, it should be combined with resources other section leads and TCLs have put together and formatted/presented through curriculum.


[faq repo]: https://github.com/howardbdev/portfolio-project-faqs
