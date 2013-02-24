RailsAdmin.config do |config|
  config.model 'Overtime' do
    list do

      field :user_id do
        label "Colaborador"
      end

    end
  end

	config.model 'User' do
		list do
			field :name do 
				label "Nome"
			end
			field :email
			field :birthday

			field :picture do
		    	formatted_value do
		        	bindings[:view].tag(:img, { :width => 50, :src => bindings[:object].picture }) 
		        end
		    end
		end
	end

end