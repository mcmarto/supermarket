class QualityMetric < ActiveRecord::Base
  has_many :metric_results

  scope :open, -> { where(admin_only: false) }
  scope :admin_only, -> { where(admin_only: true) }

  validates :name, uniqueness: true

  def self.flip_public
    update_all(admin_only: false)
    all
  end

  def self.flip_admin_only
    update_all(admin_only: true)
    all
  end

  def flip_public
    self.admin_only = false
    save
  end

  def flip_admin_only
    self.admin_only = true
    save
  end

  def self.foodcritic_metric
    QualityMetric.where(name: 'Foodcritic').first_or_create!
  end

  def self.collaborator_num_metric
    QualityMetric.where(name: 'Collaborator Number').first_or_create!
  end

  def self.publish_metric
    QualityMetric.where(name: 'Publish').first_or_create!
  end

  def self.license_metric
    QualityMetric.where(name: 'License').first_or_create!
  end

  def self.supported_platforms_metric
    QualityMetric.where(name: 'Supported Platforms').first_or_create!
  end

  def self.contributing_file_metric
    QualityMetric.where(name: 'Contributing File').first_or_create!
  end

  def self.testing_file_metric
    QualityMetric.where(name: 'Testing File').first_or_create!
  end

  def self.version_tag_metric
    QualityMetric.where(name: 'Version Tag').first_or_create!
  end

  def self.no_binaries_metric
    QualityMetric.where(name: 'No Binaries').first_or_create!
  end
end
