Player.create(username: "james", email: "james@james.com", password: "pass")
Player.create(username: "genesis", email: "genesis@g.com", password: "word")
Player.create(username: "player_3", email: "three@cchs.com", password: "third")
Player.create(username: "player_4", email: "four@cchs.com", password: "fourth")

Team.create(name: "bhs", hometown: "bedford")
Team.create(name: "cchs", hometown: "concord")

Game.create(date: 2015)
Game.create(date: 2016)

Goal.create(minute: 7, game_id: 1, player_id: 1, team_id: 1)
Goal.create(minute: 47, game_id: 1, player_id: 4, team_id: 2)
Goal.create(minute: 86, game_id: 1, player_id: 2, team_id: 1)

Goal.create(minute: 20, game_id: 2, player_id: 2, team_id: 1)
Goal.create(minute: 22, game_id: 2, player_id: 3, team_id: 2)