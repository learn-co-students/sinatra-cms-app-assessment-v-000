class TeamsController < ApplicationController

  get "/teams" do
    Helpers.redirect_if_not_logged_in(session)
    @teams = Team.all
    erb :'teams/index'
  end

  get "/teams/new" do
    Helpers.redirect_if_not_logged_in(session)
    @error_message = params[:error]
    erb :'teams/new'
  end

  get "/teams/:id" do
    Helpers.redirect_if_not_logged_in(session)
    @team = Team.find(params[:id])
    erb :'teams/show'
  end

  get "/teams/:id/edit" do
    Helpers.redirect_if_not_logged_in(session)
    @error_message = params[:error]
    @team = Team.find(params[:id])
    erb :'teams/edit'
  end

  post "/teams/:id" do
    Helpers.redirect_if_not_logged_in(session)
    @team = Team.find(params[:id])
    unless Team.valid_params?(params)
      redirect "/teams/#{@team.id}/edit?error=invalid team"
    end
    @team.update(params.select{|k|k=="name" || k=="league"})
    redirect "/teams/#{@team.id}"
  end

  post "/teams" do
    Helpers.redirect_if_not_logged_in(session)

    unless Team.valid_params?(params)
      redirect "/teams/new?error=invalid team"
    end
    @team = Team.new(params[:team])

    params[:team][:players].each do |player|
      Player.new(player)
    end

    @players = Player.all

    redirect "/teams"
  end

end
