class HomeController < ApplicationController

def index
	@user = User.first # temp, for testing
end

end
