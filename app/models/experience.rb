class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :experience_categories
  has_many :categories, through: :experience_categories

  def self.create_new_experience(params, route, session_id)
    @params = params
    @route = route

    set_details
    check_missing_value
    set_country

    @experience = Experience.new(
      :description => @details[:description],
      :country => @country,
      :user_id => session_id
    )

    set_categories

    @experience.save
  end

  def self.update_experience(params, route, experience)
    @params = params
    @route = route
    @experience = experience

    set_details
    check_missing_value
    set_country

    @experience.update(
      :description => description,
      :country => @country
    )

    @experience.categories.clear
    set_categories

    @experience.save
  end

  def self.set_details
    @details = {
      :description => @params["description"],
      :country => @params["country"]
    }
    @category_name = @params["category"]["name"]
    @category_ids = @params["category"]["category_ids"]
  end

  def self.check_missing_value
    if @route == 'new'
      redirect = 'experiences/new'
    elsif @route == 'user'
      redirect = "/experiences/#{params[:id]}/new_from_user}"
    else
      redirect = "/experiences/#{@experience.id}/edit"
    end

    is_empty?(@details, redirect)
  end

  def self.set_country
    @country = Country.find_by(:name => @details[:country]).presence || Country.create(:name => @details[:country])
  end

  def self.set_categories
    unless category_name.empty?
      # Checks for duplicates
      category = Category.find_by(:name => category_name).presence || Category.create(:name => category_name)
      @experience.categories << category
    end
    if category_ids
      category_ids.each do |id|
        @experience.categories << Category.find(id)
      end
    end
  end
end
