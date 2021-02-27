class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '日次' },
    { id: 3, name: '週次' },
    { id: 4, name: '月次' },
    { id: 5, name: '至急' },
    { id: 6, name: '重要' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :reports
end
