class InfoAd < ActiveRecord::Base

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i

	

	validates :first_name, :presence => true,
	:length => {:maximum => 25}


	validates :last_name, :presence => true,
							:length => {:maximum => 50}


	validates :email, :presence => true,
						:format => EMAIL_REGEX,
						:length => {:maximum => 100},
						:confirmation => true

	validates :street, :presence => true,
						:length => {:maximum => 100}


 	validates :city, :presence => {:message => "Empty field"}
 						

 	validates :state, :presence => true

 	validates :zip_code, :presence => true,
 						:numericality => {:only_integer => true}
 						


	scope :sorted, lambda { order("info_ads.id ASC")}
	scope :newest_first, lambda { order("info_ads.created_at DESC")}
	scope :search_first_name, lambda {|query|
		where(["first_name LIKE ?", "%#{query}%"])
	}


end
