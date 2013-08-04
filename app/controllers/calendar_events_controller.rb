class CalendarEventsController < ApplicationController
  # GET /calendar_events
  # GET /calendar_events.json
  def index
    @calendar_events = CalendarEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calendar_events }
    end
  end

  # GET /calendar_events/1
  # GET /calendar_events/1.json
  def show
    @calendar_event = CalendarEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calendar_event }
    end
  end

  # GET /calendar_events/new
  # GET /calendar_events/new.json
  def new
    @calendar_event = CalendarEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calendar_event }
    end
  end

  # GET /calendar_events/1/edit
  def edit
    @calendar_event = CalendarEvent.find(params[:id])
  end

  # POST /calendar_events
  # POST /calendar_events.json
  def create
    @calendar_event = CalendarEvent.new(params[:calendar_event])

    respond_to do |format|
      if @calendar_event.save
        format.html { redirect_to @calendar_event, notice: 'Calendar event was successfully created.' }
        format.json { render json: @calendar_event, status: :created, location: @calendar_event }
      else
        format.html { render action: "new" }
        format.json { render json: @calendar_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calendar_events/1
  # PUT /calendar_events/1.json
  def update
    @calendar_event = CalendarEvent.find(params[:id])

    respond_to do |format|
      if @calendar_event.update_attributes(params[:calendar_event])
        format.html { redirect_to @calendar_event, notice: 'Calendar event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calendar_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_events/1
  # DELETE /calendar_events/1.json
  def destroy
    @calendar_event = CalendarEvent.find(params[:id])
    @calendar_event.destroy

    respond_to do |format|
      format.html { redirect_to calendar_events_url }
      format.json { head :no_content }
    end
  end
end
