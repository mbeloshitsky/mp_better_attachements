require_dependency 'issue'

module BetterAttachementsHelperPatch
	def self.included(base)
		base.send(:include, InstanceMethods)

		base.class_eval do
			alias_method_chain :download, :viewable
		end
	end

	module InstanceMethods
		def download_with_viewable
		    if @attachment.container.is_a?(Version) || @attachment.container.is_a?(Project)
      			@attachment.increment_download
    	            end

		    show_inline = @attachment.image? || !!(@attachment.filename =~ /\.(odt|ods|pdf|doc|docx|xsl|xlsx|ppt|pptx)$/i)

                    if stale?(:etag => @attachment.digest)
                        send_file @attachment.diskfile, :filename => filename_for_content_disposition(@attachment.filename),
                            :type => detect_content_type(@attachment),
                            :disposition => (show_inline ? 'inline' : 'attachment')
		    end
		end
	end
end

AttachmentsController.send(:include, BetterAttachementsHelperPatch)
