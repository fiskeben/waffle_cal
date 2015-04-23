# WaffleCal
A simple iCal/vCal generator.

## Usage
Once the gem has been added to your Gemfile and you’ve updated your bundle, you can create calendars like this:

	calendar_id = WaffleCal::ProdId.create(‘my_entity’, ‘my_product’, ‘en’)
	calendar = WaffleCal::Calendar.new(calendar_id)
	
Create events like this:

	event = WaffleCal::Event.new(params)

where `params` is a `Hash` with these keys:

* uid: A unique identifier (mandatory)
* start_time: An instance of `Time` representing when the event starts (mandatory)
* end_time: An instace of `Time` representing when the event ends (mandatory)
* summary: The title/headline of the event (mandatory)
* description: A longer textual description (optional)
* location: Where the event is held. Can either be text or coordinates (optional).

Add the event to your calendar like this:

	calendar << event

In the end, serialize the calendar to a `String` with `to_s`:

	puts calendar.to_s
