class Format < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '日報' },
    { id: 3, name: '成果管理表' },
    { id: 4, name: 'ビジネス文書' }
  ]

  include ActiveHash::Associations
  has_many :reports
end
