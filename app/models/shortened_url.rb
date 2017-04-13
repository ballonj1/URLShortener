class ShortenedURL < ActiveRecord::Base
  validates :user_id, presence: true
  validates :short_url, uniqueness: true

  def self.random_code
    #generate random code
    random = SecureRandom.base64(16)
    #check if it exists in the schema
    if ShortenedURL.exists?(:short_url => random)
      self.random_code
    else
      random
    end
  end

  def self.generate_short_url(user, long_url)
    random = self.random_code
    ShortenedURL.create({short_url: random, long_url: long_url, user_id: user.id} )
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.select(:user_id).count
  end

  def num_recent_uniques
    self.visitors.select(:user_id).where(updated_at: (40.minutes.ago..Time.now)).count
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: "Visit"

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

end
