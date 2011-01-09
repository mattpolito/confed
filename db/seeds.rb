# Create roles
[:admin, :user].each do |role|
  Role.find_or_create_by_name(role.to_s)
end
