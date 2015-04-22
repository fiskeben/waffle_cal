require 'spec_helper'

describe WaffleCal::ProdId do

	context 'validation' do

		let (:valid_id) { id = WaffleCal::ProdId.new({entity_name: 'foo', product_name: 'bar', language: 'en'}) }

		it 'returns an ID string if complete' do
			expect(valid_id.to_s).to eq('//foo//bar//EN')
		end

		it 'uppercases language' do
			expect(valid_id.language).to eq('EN')
		end

		it 'returns default ID string if not complete' do
			expect(WaffleCal::ProdId.new.to_s).to eq('//fiskeben.dk//waffle_cal//EN')
		end
	end
	
end