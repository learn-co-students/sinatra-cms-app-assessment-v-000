class TransactionsController < ApplicationController

    get '/transactions' do
        erb :'/transactions/index'
    end
end