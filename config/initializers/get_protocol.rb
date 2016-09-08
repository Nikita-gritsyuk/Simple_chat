Warden::Manager.after_authentication do |_user, auth, _opts|
  avaible = %w(cable long_pool ajax)
  protocol = auth.params[:protocol]
  auth.raw_session['warden.user.user.protocol'] = avaible.include?(protocol) ? protocol : 'cable'
end
