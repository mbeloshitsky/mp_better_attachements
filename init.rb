require 'redmine'

require 'better_attachments_helper_patch'

Redmine::Plugin.register :mpk_better_attaches do
  name 'Mpk Better Attaches plugin'
  author 'Michel Beloshitsky'
  description 'Allow view PDF\'s and other documents (depends on browser) in browser window'
  version '0.0.2'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
