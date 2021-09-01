class PetType < ActiveHash::Base
  self.data = [
    {id: 1, name: 'トイ・プードル'},{id: 2, name: 'チワワ'},{id: 3, name: 'ミックス犬'},
    {id: 4, name: '柴犬'},{id: 5, name: 'ポメラニアン'},
    {id: 6, name: 'ミニチュアダックスフンド'},{id: 7, name: 'フレンチ・ブルドッグ'},
    {id: 8, name: 'ヨークシャー・テリア'},{id: 9, name: 'ミニチュア・シュナウザー'},
    {id: 10, name: 'シー・ズー'},{id: 11, name: '雑種'},{id: 12, name: 'その他'}
  ]
  include ActiveHash::Associations
has_many :pets
  end
