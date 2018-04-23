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

    get 'transaction/:id' do
        if logged_in?
            binding.pry
            @transaction = Transaction.find(:id)
            erb :"/transactions/show" 
        else
            redirect "/login"
        end
    end

    post '/transactions' do
        @transaction = Transaction.create(params)
        @transaction.user = current_user
        @transaction.save
        redirect "/transaction/#{@transaction.id}"
    end

end