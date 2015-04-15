require 'spec_helper'

describe WaffleCal::Calendar do
	subject { WaffleCal::Calendar.new }

	describe '#to_s' do
		it 'returns a vcalendar string' do
			expect(subject.to_s).to be_a(String)
		end
	end

	describe '<<' do
		it 'adds an event' do
			subject << WaffleCal::Event.new
			expect(subject.events.length).to eq(1)
		end
	end

	describe 'add_event' do
		it 'adds an event' do
			subject.add_event(WaffleCal::Event.new)
			expect(subject.events.length).to eq(1)
		end
	end

	describe 'events' do
		it 'returns a list of events' do
			expect(subject.events).to be_an(Array)
		end

		it 'returns all events' do
			subject << WaffleCal::Event.new
			expect(subject.events.first).to be_an(WaffleCal::Event)
		end
	end


end