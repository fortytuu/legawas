class Category < ActiveRecord::Base
	serialize :response_options, Array
end