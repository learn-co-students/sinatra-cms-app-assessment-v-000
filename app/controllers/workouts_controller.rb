class WorkoutsController < ApplicationController

  get '/workouts' do
    if logged_in?
      @workouts=Workout.all
      erb :'workouts/workouts'
    else
      redirect to '/login'
    end
  end

    get '/workouts/new' do
      if logged_in?
        erb :'workouts/new'
      else
        redirect to '/login'
      end
    end

    post '/workouts' do
      if logged_in?
        if params[:name]=="" ||
          params[:duration]=="" ||
          params[:difficulty]=="" ||
          params[:body_focus]=="" ||
          params[:training_type]=="" ||
          params[:equipment_needed]=="" ||
          params[:website]==""
          redirect to "/workouts/new"
        else
          @workout=Workout.new(name: params["name"],
            duration: params["duration"],
            difficulty: params["difficulty"],
            body_focus: params["body_focus"],
            training_type: params["training_type"],
            equipment_needed: params["equipment_needed"],
            notes: params["notes"],
            website: params["website"])
            @workout.user_id=current_user.id
            @workout.photo=@workout.assign_photo(params["training_type"])
            if @workout.save
            redirect to "/workouts/#{@workout.id}"
          else
            redirect to "/workouts/new"
          end
        end
      else
        redirect to '/login'
      end
    end

    get '/workouts/:id' do
        if logged_in?
          @workout=Workout.find_by_id(params[:id])
          erb :'workouts/show'
        else
          redirect to '/login'
        end
      end

    get '/workouts/:id/edit' do
        if logged_in?
          @workout=Workout.find_by_id(params[:id])
          if @workout.user_id=current_user.id
            erb :'workouts/edit'
          else
            redirect to "/workouts"
          end
        else
          redirect to '/login'
        end
      end

    patch '/workouts/:id' do
        if logged_in?
          if params[:name]=="" ||
           params[:duration]=="" ||
           params[:difficulty]=="" ||
           params[:body_focus]=="" ||
           params[:training_type]=="" ||
           params[:equipment_needed]=="" ||
           params[:website]==""
          redirect to "/workouts/#{params[:id]}/edit"
          else
            @workout=Workout.find_by_id(params[:id])
            if @workout.user_id=current_user.id
              @workout.update(name: params["name"],
                duration: params["duration"],
                difficulty: params["difficulty"],
                body_focus: params["body_focus"],
                training_type: params["training_type"],
                equipment_needed: params["equipment_needed"],
                notes: params["notes"],
                website: params["website"])
              redirect to "/workouts/#{@workout.id}"
            else
              redirect to "/workouts"
            end
          end
        else
          redirect to '/login'
        end
      end

    delete '/workouts/:id/delete' do
        if logged_in?
          @workout=Workout.find_by_id(params[:id])
          if @workout.user_id==current_user.id
            @workout.delete
          end
          redirect to "/workouts"
        else
          redirect to '/login'
        end
    end

end
