class MusicalInstrument < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ボーカル' },
    { id: 3, name: 'ギター' },
    { id: 4, name: 'ベース' },
    { id: 5, name: 'ドラム' },
    { id: 6, name: 'キーボード' },
    { id: 7, name: '金管楽器' },
    { id: 8, name: '木管楽器' },
    { id: 9, name: 'その他' },
  ]
  
  include ActiveHash::Associations
  has_many :bandposts

end