class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ジャンル' },
    { id: 2, name: 'ロック' },
    { id: 3, name: 'Jポップ' },
    { id: 4, name: 'ファンク' },
    { id: 5, name: 'パンク' },
    { id: 6, name: 'メロコア' },
    { id: 7, name: 'メタル' },
    { id: 8, name: 'ラウド' },
    { id: 9, name: 'スカ' },
    { id: 10, name: 'ブルース' },
    { id: 11, name: 'オルタナティブ' },
    { id: 12, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :bandposts
  has_many :soloposts

end
