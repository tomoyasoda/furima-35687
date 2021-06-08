FactoryBot.define do
  factory :user do
    nickname              {'hoge'}
    email                 {'hoge@hoge'}
    password              {'hogehoge1'}
    password_confirmation {password}
    first_name            {'ほげ'}
    last_name             {'ふが'} 
    first_kana_name       {'ホゲ'}
    last_kana_name        {'フガ'}
    birthday              {'2021/6/1'}
  
    
  end
end
