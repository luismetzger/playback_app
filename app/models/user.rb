class User < ApplicationRecord
	has_many :concerts
		#maybe add dependant destroy
end
