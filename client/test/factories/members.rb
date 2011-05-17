Factory.redefine(:member) do |f|
  f.forename 'John'
  f.surname 'Smith'
  f.sequence(:username) {|n| "johnsmith#{n}"}
  f.sequence(:email) {|n| "test#{n}@test.com"}
  f.password 'pa55w0rd'
  f.country 'United Kingdom'
  f.what_i_bring 'cheese'
end

Factory.redefine(:admin_member, :parent => :member) do |m|
  m.is_admin true
end
