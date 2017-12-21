class TeamsController < ApplicationController

  get "/teams" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @teams = Team.all
    erb :'teams/index'
  end

  get "/teams/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'teams/new'
  end

  get "/teams/:id" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @team = Team.find(params[:id])
    erb :'teams/show'
  end

  get "/teams/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @team = Team.find_by_id(params[:id])
    if @team.user_id == session[:user_id]
      erb :'teams/edit'
    else
      redirect to '/teams?error=Unauthorized user'
    end
  end

  patch "/teams/:id" do
    redirect_if_not_logged_in
    unless Team.valid_params?(params[:team]) && Player.valid_params?(params[:players])
      redirect "/teams/#{params[:id]}/edit?error=Invalid team"
    end
    t = params[:team]
    @team = Team.find_by_id(params[:id])
    @team.players.each do |p|
      p.delete
    end
    @team.delete
    @team = Team.create(:name => t[:name], :league => t[:league], :user_id => session[:user_id])
    @players = []
    @team = Team.find_by_id(@team.id)
    params[:players].each do |p|
      @player = Player.create(:name => p[:name], :position => p[:position], :price => p[:price], :team_id => @team.id)
      @players << @player
    end
    redirect "/teams/#{@team.id}"
  end

  post "/teams" do
    redirect_if_not_logged_in
    unless Team.valid_params?(params[:team]) && Player.valid_params?(params[:players])
      redirect "/teams/new?error=invalid team"
    end
    t = params[:team]
    @team = Team.create(:name => t[:name], :league => t[:league], :user_id => session[:user_id])
    @players = []
    params[:players].each do |p|
      @player = Player.create(:name => p[:name], :position => p[:position], :price => p[:price], :team_id => @team.id)
      @players << @player
    end
    redirect "/teams"
  end

  delete '/teams/:id/delete' do
    if session[:user_id]
      @team = Team.find_by_id(params[:id])
      if @team.user_id == session[:user_id]
        team_id = @team.id
        @team.delete
        @team.players.each do |p|
          p.delete
        end
        redirect to '/teams'
      else
        redirect to '/teams?error=Unauthorized user'
      end
    else
      redirect to '/login'
    end
  end

end
