module WaffleCal

	class ProdId
		attr_accessor :entity_name, :product_name, :language

		def initialize(attrs={})
			@entity_name = attrs[:entity_name]
			@product_name = attrs[:product_name]
			@language = attrs[:language].upcase if attrs.has_key?(:language)
		end

		def to_s
			if complete?
				"//#{@entity_name}//#{@product_name}//#{@language}"
			else
				default_prod_id.to_s
			end
		end

		private

		def complete?
			@entity_name && @product_name && @language
		end

		def default_prod_id
			ProdId.new({entity_name: 'fiskeben.dk', product_name: 'waffle_cal', language: 'EN'})
		end
	end
end