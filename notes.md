# Models
## User
  name [x]
  email [x]
  password [x]
  has many sleep logs [x]
  has many energy logs
  has many caffeine logs
## Sleep log
  Date(time wakeup) [x]
  sleep/nap [x]
  hours [x]
  notes- did not include
  belong to user [x]
## Energy log- did not include
  date time
  rating
  belongs to user
## Caffeine log- did note include
  date time
  mgs
  belongs to user

##Fix queue
  define a block in app controller with helpers
  fix restful conventions
