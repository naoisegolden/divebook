class Image < ActiveRecord::Base
  belongs_to :dive

  has_attached_file :file,
             styles: { thumbnail: '150x150>',
                          medium: '300x300>',
                        standard: '600x600>'},
    convert_options: { thumbnail: '-quality 85 -strip',
                          medium: '-quality 85 -strip',
                        standard: '-quality 80 -strip' }

  validates :dive, presence: true
  validates_attachment :file,
    presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] }
end
