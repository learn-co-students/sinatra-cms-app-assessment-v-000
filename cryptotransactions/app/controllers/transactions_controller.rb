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

        @transaction = Transaction.create(params)
        @transaction.user = current_user
        
        binding.pry
    end

end