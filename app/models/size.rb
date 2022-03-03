class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'S'},
    { id: 3, name: 'M'},
    { id: 4, name: 'L'},
    { id: 5, name: 'LL'},
  ]

  include ActiveHash::Associations
  belongs_to :pruchase
  
end