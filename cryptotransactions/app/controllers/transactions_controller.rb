class TransactionsController < ApplicationController

    get '/transactions' do
        erb :'/transactions/index'
    end

    get '/transactions/new' do
        if logged_in?
            erb :'/transactions/new'
        else
            redirect '/login'
        end
    end

    post '/transactions' do
        if params[:currency]=="" || params[:price]==""
            redirect '/transactions/new'
        else
            @transaction = Transaction.create(params)
            @transaction.user = current_user
            @transaction.save
            redirect "/transactions/#{@transaction.id}"
        end
    end

    get '/transactions/:id' do
        if logged_in?
            @transaction = Transaction.find(params[:id])
            erb :"/transactions/show" 
        else
            redirect "/login"
        end
    end

    get '/transactions/:id/edit' do
        if logged_in?
            @transaction = Transaction.find(params[:id])
            if @transaction && @transaction.user == current_user
                erb :"/transactions/edit"
            else
                redirect "/users/#{current_user.slug}"
            end
        else
            redirect "/login"
        end
    end

    patch '/transactions/:id' do
        if logged_in?
            if params[:currency]=="" || params[:price]==""
                redirect "/transactions/#{@transaction.id}/edit"
            else
                @transaction = Transaction.find(params[:id])
                if @transaction && @transaction.user == current_user
                    if @transaction.update(currency: params[:currency], price: params[:price], comments: params[:comments])
                        redirect "/transactions/#{@transaction.id}"
                    else
                        redirect "/transactions/#{@transaction.id}/edit"
                    end
                else
                    redirect "/users/#{current_user.slug}"
                end
            end
        else
            redirect "/login"
        end
    end


    delete '/transactions/:id/delete' do
        if logged_in?
          @transaction = Transaction.find(params[:id])
          if @transaction && @transaction.user == current_user
            @transaction.delete
          end
          redirect to "/users/#{current_user.slug}"
        else
          redirect to '/login'
        end
      end

end
