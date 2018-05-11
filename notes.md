# Models
## User
  name
  email
  password
  has many sleep logs
  has many energy logs
  has many caffeine logs
## Sleep log
  Date(time wakeup)
  sleep/nap
  hours
  notes
  belong to user
## Energy log
  date time
  rating
  belongs to user
## Caffeine log
  date time
  mgs
  belongs to user
