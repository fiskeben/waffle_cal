require 'spec_helper'

describe WaffleCal::Event do

	it 'serializes to string' do
		event = WaffleCal::Event.new({uid: 'my-uid', start_time: Time.now - 100, end_time: Time.now + 100, summary: 'Some event', description: 'Very event', location: 'Moon'})
		expect(event.to_s).to be_a(String)
	end

	context 'validation' do

		it 'raises error if uid is missing' do
			event = WaffleCal::Event.new({start_time: Time.now, end_time: Time.now + 100, summary: 'Some event', description: 'Very event', location: 'Moon'})
			expect { event.to_s }.to raise_error(WaffleCal::Errors::IncompleteEventError)
		end

		it 'raises error if start_time is missing' do
			event = WaffleCal::Event.new({uid: 'my-uid', end_time: Time.now + 100, summary: 'Some event', description: 'Very event', location: 'Moon'})
			expect { event.to_s }.to raise_error(WaffleCal::Errors::IncompleteEventError)
		end

		it 'raises error if end_time is missing' do
			event = WaffleCal::Event.new({uid: 'my-uid', start_time: Time.now, summary: 'Some event', description: 'Very event', location: 'Moon'})
			expect { event.to_s }.to raise_error(WaffleCal::Errors::IncompleteEventError)
		end

		it 'raises error if summary is missing' do
			event = WaffleCal::Event.new({uid: 'my-uid', start_time: Time.now, end_time: Time.now + 100, description: 'Very event', location: 'Moon'})
			expect { event.to_s }.to raise_error(WaffleCal::Errors::IncompleteEventError)
		end


		it 'raises error if end time is before start time' do
			event = WaffleCal::Event.new({uid: 'my-uid', start_time: Time.now, end_time: Time.now - 100, summary: 'Some event', description: 'Very event', location: 'Moon'})
			expect { event.to_s }.to raise_error(WaffleCal::Errors::IllegalEventError)
		end

	end	
	
end