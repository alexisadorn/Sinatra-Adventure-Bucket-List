class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :experience_categories
  has_many :categories, through: :experience_categories

  def self.create_new_experience(details, category_name, category_ids, session_id)
    @details = details
    @category_name = category_name
    @category_ids = category_ids

    set_country

    @experience = Experience.new(
      :description => @details[:description],
      :country => @country,
      :user_id => session_id
    )

    set_categories

    @experience.save
  end

  def self.update_experience(details, category_name, category_ids, experience)
    @details = details
    @category_name = category_name
    @category_ids = category_ids
    @experience = experience

    set_country

    @experience.update(
      :description => @details[:description],
      :country => @country
    )

    @experience.categories.clear
    set_categories

    @experience.save
  end

  def self.set_country
    @country = Country.find_by(:name => @details[:country]).presence || Country.create(:name => @details[:country])
  end

  def self.set_categories
    unless @category_name.empty?
      # Checks for duplicates
      category = Category.find_by(:name => @category_name).presence || Category.create(:name => @category_name)
      @experience.categories << category
    end
    if @category_ids
      @category_ids.each do |id|
        @experience.categories << Category.find(id)
      end
    end
  end
end
