Factory.define :admin_role, :class => Role do |f|
  f.name 'admin'
end

Factory.define :super_admin_role, :class => Role do |f|
  f.name 'super_admin'
end
