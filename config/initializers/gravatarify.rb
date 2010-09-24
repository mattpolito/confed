Gravatarify.options[:default] = Proc.new { |*params| "http://localhost:3000/images/default_avatar_#{params.first[:size] || 80}.png" }
Gravatarify.options[:html] = { :class => 'gravatar' }

